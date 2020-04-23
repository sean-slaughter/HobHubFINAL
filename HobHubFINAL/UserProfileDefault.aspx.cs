using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace HobHubFINAL
{
    public partial class UserProfileDefault : System.Web.UI.Page
    {
        SqlConnection conn = null;
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            //check to see if user is trying to add items
            if(Request.QueryString["update"] == "true")
            {
                btnAddNewItem.Visible = false;
                lblAddItems.Visible = true;
                fileUploadAddNewItem.Visible = true;
                fileUploadAddNewItem2.Visible = true;
                fileUploadAddNewItem3.Visible = true;
                fileUploadAddNewItem4.Visible = true;
                txtAddItemDescription.Visible = true;
                txtAddItemName.Visible = true;
                btnAddItem.Visible = true;
            }
            else
            {
                lblAddItems.Visible = false;
                fileUploadAddNewItem.Visible = false;
                fileUploadAddNewItem2.Visible = false;
                fileUploadAddNewItem3.Visible = false;
                fileUploadAddNewItem4.Visible = false;
                txtAddItemDescription.Visible = false;
                txtAddItemName.Visible = false;
                btnAddItem.Visible = false;
            }
            if (Request.Cookies["UserID"].Value != null)
            {
                //queries to get User info and UserHobbies to populate profile info
                string userQuery = "SELECT * FROM [Users] WHERE [UserID] = " + Request.Cookies["UserID"].Value;
                string hobbiesQuery = "SELECT Name FROM Hobby h, UserHobby u WHERE u.HobbyID = h.HobbyID AND u.UserID = " + Request.Cookies["UserID"].Value;


                //User info will be stored here for easy access
                Object[] userInfo;
                
                
                try
                {
                    conn = new SqlConnection(connString);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(userQuery, conn);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        //insert user info into array TO DO: make sure password is not accessible
                        userInfo = new Object[dr.FieldCount];
                        dr.GetValues(userInfo);
                        lblUsername.Text = userInfo[1].ToString() + "'s Profile";
                        lblLocation.Text = "Location: </br>" + userInfo[3].ToString() + "</br></br>";
                        lblRating.Text = "Rating : </br>" + userInfo[5].ToString() + "</br></br>";
                        if(userInfo[4].ToString() != String.Empty)
                        {
                            byte[] photoBytes = (byte[])userInfo[4];
                            string base64 = Convert.ToBase64String(photoBytes);
                            //profile pic
                            imgProfile.ImageUrl = "data:Image/png;base64," + base64;
                            imgProfile.Width = 250;
                            imgProfile.Height = 250;
                            imgProfile.Style.Add("border-radius", "50%");
                            //profile navbar icon
                            hpUserProfileNav.ImageUrl = imgProfile.ImageUrl;
                            hpUserProfileNav.Height = 50;
                            hpUserProfileNav.Width = 50;
                            hpUserProfileNav.Style.Add("border-radius", "50%");
                        }
                        else
                        {
                            imgProfile.ImageUrl = "~/Images/profiledefault.png";
                        }
                        dr.Close();
                        cmd.Dispose();
                    }

                    //get hobby info
                    cmd = new SqlCommand(hobbiesQuery, conn);
                    dr = cmd.ExecuteReader();
                    string output = string.Empty;
                    while (dr.Read())
                    {
                        output += dr.GetString(0) + "</br>";
                    }
                    lblHobbies.Text = "Hobbies : </br>" + output +"</br>";
                    cmd.Dispose();
                    dr.Close();
                }
                catch(Exception ex)
                {
                    lblUsername.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
        }

      



        protected void BtnEditInformation_Click(object sender, EventArgs e)
        {

            Response.Redirect("EditProfileInformation.aspx");
        }

        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnShowMoreInfo_Click(object sender, CommandEventArgs e)
        {
            string name = string.Empty;
           if(e.CommandName == "Select"){
                try
                {
                    int arg = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gridItems.Rows[arg];
                    name = row.Cells[1].Text;

                }
                catch(Exception ex)
                {
                    lblUsername.Text = ex.Message;
                }
                finally
                {
                    Response.Redirect("Item.aspx?item=" + name);
                }

            }
        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfileDefault.aspx?update=true");
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            //array of photos to be added to database
            HttpPostedFile[] postedFiles = new HttpPostedFile[4];
            postedFiles[0] = fileUploadAddNewItem.PostedFile;
            postedFiles[1] = fileUploadAddNewItem2.PostedFile;
            postedFiles[2] = fileUploadAddNewItem3.PostedFile;
            postedFiles[3] = fileUploadAddNewItem4.PostedFile;
            //other data to be added
            string itemName = txtAddItemName.Text;
            string description = txtAddItemDescription.Text;
            //add new item with item name and description
            string query1 = "INSERT INTO Item (Name, Description, UserID)" +
                            " VALUES ('" + itemName + "', '" + description + "' ," + userID +")";
            string query2 = "SELECT ItemID FROM Item WHERE Name = '" +
                            itemName + "' AND Description = '" + description + "'";
            try
            {
                conn.Open();
                //insert new item
                SqlCommand cmd = new SqlCommand(query1, conn);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                //get item id
                cmd = new SqlCommand(query2, conn);
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.Dispose();
                conn.Close();
                //upload photos
                for(int i = 0; i < postedFiles.Length; i++)
                {
                    if(postedFiles[i] != null && postedFiles[i].ContentLength > 1)
                    {
                        addPhoto(postedFiles[i], i + 1, id);
                    }
                }
            }
            catch(Exception ex)
            {
                lblUsername.Text = ex.Message + ex.StackTrace;
            }
            finally
            {
                Response.Redirect("UserProfileDefault.aspx");
            }

        }

       

        protected void addPhoto(HttpPostedFile upload, int uploadID, int itemID)
        {
            try
            {
                conn = new SqlConnection(connString);
                conn.Open();
                HttpPostedFile toUpload = upload;
                string fileExtension = Path.GetExtension(toUpload.FileName);
                //only let user upload image files
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpeg"
                    || fileExtension.ToLower() == ".bmp")
                {
                    try
                    {
                        Stream stream = toUpload.InputStream;
                        BinaryReader read = new BinaryReader(stream);
                        byte[] photoBytes = read.ReadBytes((int)stream.Length);
                        string query = "UPDATE Item SET Image" + uploadID + " = @Data WHERE ItemID =" + itemID;
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.Add("@Data", SqlDbType.Binary);
                        cmd.Parameters["@Data"].Value = photoBytes;
                        int output = cmd.ExecuteNonQuery();
                        if (output != 1) lblUsername.Text = "Error saving photo to database";
                        cmd.Dispose();
                        stream.Dispose();
                        read.Dispose();
                    }
                    catch(Exception ex)
                    {
                        lblUsername.Text = "Error adding photos to database. " + ex.Message;
                    }
                    
                }
            }
            catch(Exception ex)
            {
                lblUsername.Text = "Error adding photos to database. " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}