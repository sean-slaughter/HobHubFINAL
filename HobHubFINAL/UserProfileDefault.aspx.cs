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
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Request.Cookies["UserID"].Value != null)
            {
                //queries to get User info and UserHobbies to populate profile info
                string userQuery = "SELECT * FROM [Users] WHERE [UserID] = " + Request.Cookies["UserID"].Value;
                string hobbiesQuery = "SELECT Name FROM Hobby h, UserHobby u WHERE u.HobbyID = h.HobbyID AND u.UserID = " + Request.Cookies["UserID"].Value;


                string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlCommand cmd;
                //User info will be stored here for easy access
                Object[] userInfo;
                SqlConnection conn = null;
                
                try
                {
                    conn = new SqlConnection(connString);
                    conn.Open();
                    cmd = new SqlCommand(userQuery, conn);
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
                    lblHobbies.Text = "Hobbies : </br>" + output +"</br></br>";

                    
                   
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

        protected void btnEditItems_Click(object sender, EventArgs e)
        {

        }



        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("EditProfileInformation.aspx");
        }

        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}