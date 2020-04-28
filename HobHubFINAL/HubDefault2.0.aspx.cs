using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HobHubFINAL
{
    public partial class HubDefault2__0 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnExplore_Click(object sender, EventArgs e)
        {
            //SELECT Employees.FirstName,             
            //Employees.LastName, Department.DepartmentName, 
            //Employees.EmployeeID FROM Employees INNER JOIN Department ON 
            //Employees.DepartmentRole = Department.DepartmentID 
            //WHERE (Employees.FirstName LIKE '%' + @FirstName + '%') 
            //OR (Employees.LastName LIKE '%' + @LastName + '%') OR
            //(Employees.Email LIKE '%' + @Email + '%') 
            //ORDER BY Employees.FirstName DESC, Employees.LastName DESC
 
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd;
            string sql;
            DataTable gridTable = new DataTable();
            
            if(txtExplore.Text != " ")
            {
               sql = "SELECT Hobby.Name, Posting.Caption, ItemHobby.ItemID "+
                    "FROM Hobby INNER JOIN ItemHobby "+
                    "ON Hobby.HobbyID = ItemHobby.HobbyID INNER JOIN Posting "+
                    "ON ItemHobby.ItemID = Posting.ItemID "+
                    "WHERE Hobby.Name LIKE '%"+txtExplore.Text+"%' OR "+
                    "Posting.Caption LIKE '%"+txtExplore.Text+"%' " +
                    "ORDER BY  Hobby.Name DESC";

                try
                {
                    conn.Open();
                    cmd = new SqlCommand(sql, conn);
                    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    Response.Write(dr.ToString());
                    gridTable.Load(dr);

                }
                catch(Exception ex)
                {
                    Response.Write("Error: " + ex);
                }
                finally
                {
                    conn.Close();
                }

                gvHubPosts.DataSource = gridTable;
                gvHubPosts.DataBind();

            }
            
            
             }

        protected void hpUsername_OnRowDataBound(Object sender, GridViewRowEventArgs e)
        {
            
            e.Row.Cells[3].Text = "Test for load";
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
           int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            string username = String.Empty;

            string caption = txtPost.Text;
            SqlConnection conn = null;
            if (fuPost.HasFile)
            try
            {
                string connString =
                ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                conn = new SqlConnection(connString);
                
                    //get image from file upload control
                    HttpPostedFile post = fuPost.PostedFile;
                    //make sure it's an image file
                    string fileExtension = Path.GetExtension(post.FileName);
                    if(fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".bmp" || fileExtension == ".gif")
                    {
                        //open sql connection
                        conn.Open();
                        //get username
                        string usernameQuery = "SELECT UserName from Users where UserID = " + userID;
                        using(SqlCommand cmd = new SqlCommand(usernameQuery, conn))
                        {
                            username = Convert.ToString(cmd.ExecuteScalar());
                        }
                        //convert photo to byte array
                        Stream stream = post.InputStream;
                        BinaryReader read = new BinaryReader(stream);
                        byte[] photoBytes = read.ReadBytes((int)stream.Length);
                        //create sql command
                        string postQuery = "INSERT INTO Posting (Username, PostedDate, Photo, Caption)" +
                            " VALUES ('" + username + "', @PostedDate, @Photo, '" + caption + "')";
                        using(SqlCommand cmd = new SqlCommand(postQuery, conn))
                        {
                            //give values to command parameters
                            cmd.Parameters.Add("@PostedDate", SqlDbType.DateTime);
                            cmd.Parameters["@PostedDate"].Value = DateTime.Now;
                            cmd.Parameters.Add("@Photo", SqlDbType.Binary);
                            cmd.Parameters["@Photo"].Value = photoBytes;
                            //execute command
                            cmd.ExecuteNonQuery();
                        }                        
                    }
                }
            catch (Exception ex)
            {
                // handle error here
               Response.Write("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}