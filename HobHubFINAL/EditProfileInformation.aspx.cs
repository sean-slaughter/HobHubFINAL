using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace HobHubFINAL
{
    public partial class EditProfileInformation : System.Web.UI.Page
    {
        Int32 userID;
        SqlConnection conn;
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand cmd;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["upload"] == "successful_photo") lblPhotoError.Text = "Upload successful";
            if (Request.QueryString["upload"] == "successful_info") lblInfoError.Text = "Upload successful";

            try
            {
                //load location
                userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
                string userQuery = "SELECT Location FROM Users WHERE UserID = " + userID;
                conn = new SqlConnection(conString);
                conn.Open();
                cmd = new SqlCommand(userQuery, conn);
                lblCurrentLocation.Text = "Current Location : " + cmd.ExecuteScalar() + "</br></br>";
                cmd.Dispose();

                //load hobbies
                string hobbiesQuery = "SELECT Name FROM Hobby h, " +
                                      "UserHobby u WHERE u.HobbyID = " +
                                      "h.HobbyID AND u.UserID = " + Request.Cookies["UserID"].Value;
                cmd = new SqlCommand(hobbiesQuery, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                string output = "Current hobbies : ";
                while (dr.Read())
                {
                    output += dr.GetString(0).Trim() + ", ";
                }
                lblCurrentHobbies.Text = output + "</br></br>";
                cmd.Dispose();
                dr.Close();
                //load photo
                string photoQuery = "SELECT ProfileImage FROM Users WHERE UserID = " + userID;
                cmd = new SqlCommand(photoQuery, conn);
                byte[] photoBytes = (byte[])cmd.ExecuteScalar();
                string base64 = Convert.ToBase64String(photoBytes);
                //profile pic
                imgProfile.ImageUrl = "data:Image/png;base64," + base64;
                imgProfile.Width = 250;
                imgProfile.Height = 250;
                imgProfile.Style.Add("border-radius", "50%");
               

            }
            catch (Exception ex)
            {
                lblInfoError.Text = "Error loading data. " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnChangePhoto_Click(object sender, EventArgs e)
        {
            string fileName = String.Empty;
            try
            {

                HttpPostedFile toUpload = fileChangePhoto.PostedFile;
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
                        conn = new SqlConnection(conString);
                        conn.Open();
                        string query = "UPDATE Users SET ProfileImage = @Data WHERE UserID = " + userID;
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.Add("@Data", SqlDbType.Binary);
                        cmd.Parameters["@Data"].Value = photoBytes;
                        int output = cmd.ExecuteNonQuery();
                        if (output != 1) lblPhotoError.Text = "Error saving photo to database";
                        cmd.Dispose();

                    }
                    catch (Exception ex)
                    {
                        lblPhotoError.Text = "Error saving photo to database." + ex.Message;
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
                else
                {
                    //wasn't an image file
                    lblPhotoError.Text = "Enter valid file to upload (.jpg, .png, .bmp, .jpeg)";
                }
            }
            catch (Exception ex)
            {
                lblPhotoError.Text = "Error reading file " + ex.Message;
            }
            finally
            {
                Response.Redirect("EditProfileInformation.aspx?upload=successful_photo");
            }
        }

        protected void btnEditInfo_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string location = txtLocation.Text;
                string addHob = txtAddHobbies.Text;
                string deleteHob = txtRemoveHobbies.Text;

                if (location.Length > 1)
                {
                    string locQuery = "UPDATE Users SET Location = + '" + txtLocation.Text + "' WHERE UserID = " + userID;
                    cmd = new SqlCommand(locQuery, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                if (addHob.Length > 1)
                {
                    string addHobbies = "INSERT INTO Hobby (Name) VALUES ('" + txtAddHobbies.Text + "')";
                    cmd = new SqlCommand(addHobbies, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    string getHobby = "SELECT HobbyID FROM Hobby WHERE Name = ('" + txtAddHobbies.Text + "')";
                    cmd = new SqlCommand(getHobby, conn);
                    int hobbyId = (int)cmd.ExecuteScalar();
                    cmd.Dispose();
                    string updateHobbies = "INSERT INTO UserHobby (UserID, HobbyID) VALUES (" + userID + "," + hobbyId + ")";
                    cmd = new SqlCommand(updateHobbies, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                if (deleteHob.Length > 1)
                {
                    string getHobby = "SELECT HobbyID FROM Hobby WHERE Name = ('" + txtRemoveHobbies.Text + "')";
                    cmd = new SqlCommand(getHobby, conn);
                    int hobbyId = (int)cmd.ExecuteScalar();
                    cmd.Dispose();
                    string deleteHobby = "DELETE FROM UserHobby WHERE HobbyID = " + hobbyId + "AND UserID = "
                                           + userID;
                    cmd = new SqlCommand(deleteHobby, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
            }
            catch (Exception ex)
            {
                lblInfoError.Text = "Error updating info in database" + ex.Message + ex.StackTrace;
            }
            finally
            {
                conn.Close();
                Response.Redirect("EditProfileInformation.aspx?upload=successful_info");
            }
        }
    } 
}
        
    
