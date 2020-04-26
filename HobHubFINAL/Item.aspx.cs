using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using Image = System.Web.UI.WebControls.Image;


namespace HobHubFINAL
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection conn;
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //dont display editing ability
            btnEditItem.Visible = true;
            txtEditDescription.Visible = false;
            txtEditHobby.Visible = false;
            txtEditName.Visible = false;
            lblEditAvail.Visible = false;
            calStartDate.Visible = false;
            calEndDate.Visible = false;
            btnSubmit.Visible = false;
            btnDelete.Visible = false;
      
            //get userid and item id
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int itemID = -1;
            int hobbyID = -1;

            if (Request.QueryString["item"] != null)
            {
                itemID = Convert.ToInt32(Request.QueryString["item"]);
            }
            conn = null;

            //get data for item
            try
            {
                string itemQuery = "SELECT * FROM Item WHERE UserID = " + userID +
                    " AND ItemID = " + itemID;
                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(itemQuery, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                cmd.Dispose();
                if (dr.Read())
                {
                    //store item db columns in object array
                    Object[] itemInfo = new Object[dr.FieldCount];
                    dr.GetValues(itemInfo);

                    //fill page with item info
                    lblItemName.Text = itemInfo[3].ToString();
                    lblDescription.Text = itemInfo[4].ToString();
                    if (itemInfo[2].ToString() != String.Empty)
                    {
                        hobbyID = Convert.ToInt32(itemInfo[2]);
                    }
                    //display photos
                    Image[] placeHolders = { imgItem1, imgItem2, imgItem3, imgItem4 };
                    for (int i = 0, j = 5; i < 4; i++, j++)
                    {
                        if (itemInfo[j].ToString() != String.Empty)
                        {
                            byte[] photoBytes = (byte[])itemInfo[j];
                            string base64 = Convert.ToBase64String(photoBytes);
                            placeHolders[i].ImageUrl = "data:Image/png;base64," + base64;
                            placeHolders[i].Width = 250;
                            placeHolders[i].Height = 250;
                            placeHolders[i].Style.Add("border-radius", "5%");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblDescription.Text = "Error loading item data." + ex.StackTrace;
            }
            finally
            {
                conn.Close();
            }
            //get hobbies for item
            string query = "SELECT h.Name FROM Hobby h, Item i  " +
                            "WHERE i.HobbyID = h.HobbyID AND i.HobbyID = "
                            + hobbyID + " AND i.UserID = " + userID;
            try
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand(query, conn))
                {
                    lblHobbies.Text = (String)cmd.ExecuteScalar();
                    
                }
            }
            catch(Exception ex)
            {
                lblDescription.Text = "Error displaying hobby" + ex.Message;

            }
            finally
            {
                conn.Close();
            }
        }

        protected void calAvailability_DayRender(object sender, DayRenderEventArgs e)

        {
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int itemID = -1;
            DateTime startDate = DateTime.Today;
            DateTime endDate = DateTime.Today;
            if (Request.QueryString["item"] != null)
            {
                itemID = Convert.ToInt32(Request.QueryString["item"]);
            }
            //get start date and end date
            try
            {
                String startQuery = "SELECT StartAvailableDate FROM Item WHERE UserID = " + userID +
                    " AND ItemID = " + itemID;
                String endQuery = "SELECT EndAvailableDate FROM Item WHERE UserID = " + userID +
                    " AND ItemID = " + itemID;
                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd2 = new SqlCommand(startQuery, conn);
                startDate = (DateTime)cmd2.ExecuteScalar();
                cmd2.Dispose();
                cmd2 = new SqlCommand(endQuery, conn);
                endDate = (DateTime)cmd2.ExecuteScalar();
                cmd2.Dispose();
            }
            catch (Exception ex)
            {
                lblDescription.Text = "Error loading availability from database" + ex.Message;
            }
            finally
            {
                conn.Close();
            }
            if (e.Day.Date < startDate)
            {
                e.Cell.ForeColor = Color.Red;
            }
            if (e.Day.Date > endDate)
            {
                e.Cell.ForeColor = Color.Red;
            }
        }

        protected void btnEditItem_Click(object sender, EventArgs e)
        {
            //make item editable
            btnEditItem.Visible = false;
            txtEditDescription.Visible = true;
            txtEditHobby.Visible = true;
            txtEditName.Visible = true;
            calStartDate.Visible = true;
            calEndDate.Visible = true;
            btnSubmit.Visible = true;
            btnDelete.Visible = true;
            lblEditAvail.Visible = true;

        }

        protected void calEndDate_SelectionChanged(object sender, EventArgs e)
        {
            //get user and item info
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int itemID = -1;
            if (Request.QueryString["item"] != null)
            {
                itemID = Convert.ToInt32(Request.QueryString["item"]);
            }
            try
            {
                //update end date in db
                DateTime newEnd = calEndDate.SelectedDate;
                string dateQuery = "UPDATE Item SET EndAvailableDate = @EndDate WHERE UserID = "
                    + userID + "AND ItemID = " + itemID;
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(dateQuery, conn))
                {
                    cmd.Parameters.Add("@EndDate", SqlDbType.DateTime);
                    cmd.Parameters["@EndDate"].Value = newEnd;
                    cmd.ExecuteNonQuery();
                }
            }
            catch(Exception ex)
            {
                lblDescription.Text = "Error updating start date" + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //get user and item info
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int itemID = -1;
            int hobbyID = -1;
            if (Request.QueryString["item"] != null)
            {
                itemID = Convert.ToInt32(Request.QueryString["item"]);
            }
            try
            {
                //update location and description in db
                conn = new SqlConnection(connString);
                conn.Open();
                string name = txtEditName.Text;
                string description = txtEditDescription.Text;
                string updateName = "UPDATE Item SET Name = '" + name + "' WHERE ItemID = " + itemID
                    + " AND UserID = " + userID;
                string updateDescription = "UPDATE Item SET Description = '" + description + "' WHERE ItemID = " + itemID
                    + " AND UserID = " + userID;
                using(SqlCommand cmd = new SqlCommand(updateName, conn))
                {
                    if(name.Length > 1)
                    cmd.ExecuteNonQuery();
                }
                using(SqlCommand cmd = new SqlCommand(updateDescription, conn))
                {
                    if(description.Length > 1)
                    cmd.ExecuteNonQuery();
                }
                string hobby = txtEditHobby.Text;
                //check to see if hobby entered is already in db
                string hobbyQuery = "SELECT HobbyID FROM Hobby WHERE Name = '" + hobby + "'";
                using(SqlCommand cmd = new SqlCommand(hobbyQuery, conn))
                {
                    hobbyID = Convert.ToInt32(cmd.ExecuteScalar());
                }
                //add hobby if it isn't
                string addHobby = "INSERT INTO Hobby (Name) VALUES '" + hobby + "'";
                if(hobbyID == -1)
                {
                    using(SqlCommand cmd = new SqlCommand(addHobby))
                    {
                        cmd.ExecuteNonQuery();
                    }
                    using(SqlCommand cmd = new SqlCommand(hobbyQuery, conn))
                    {
                        hobbyID = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }
                //update item hobby id once hobby exists
                string updateHobby = "UPDATE Item SET HobbyID = " + hobbyID + 
                                    " WHERE ItemID = " + itemID + "AND UserID = " + userID;
                using(SqlCommand cmd = new SqlCommand(updateHobby, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                lblDescription.Text = "Error updating name and description." + ex.Message;
            }
            finally
            {
                conn.Close();
                Response.Redirect("Item.aspx?item=" + itemID);
            }
        }

        protected void calStartDate_SelectionChanged(object sender, EventArgs e)
        {
            //get item and user info
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int itemID = -1;
            if (Request.QueryString["item"] != null)
            {
                itemID = Convert.ToInt32(Request.QueryString["item"]);
            }
            try
            {
                //update start date in db
                DateTime newStart = calStartDate.SelectedDate;
                string dateQuery = "UPDATE Item SET StartAvailableDate = @StartDate WHERE UserID = "
                    + userID + "AND ItemID = " + itemID;
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(dateQuery, conn))
                {
                    cmd.Parameters.Add("@StartDate", SqlDbType.DateTime);
                    cmd.Parameters["@StartDate"].Value = newStart;
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                lblDescription.Text = "Error updating start date" + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int itemID = -1;
            if (Request.QueryString["item"] != null)
            {
                itemID = Convert.ToInt32(Request.QueryString["item"]);
            }
            string deleteQuery = "DELETE FROM Item WHERE ItemID = " + itemID + "AND UserID = " + userID;
            try
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }
            catch(Exception ex)
            {
                lblDescription.Text = "Error deleting item";
            }
            finally
            {
                conn.Close();
                Response.Redirect("UserProfileDefault.aspx");
            }
        }
    }
}