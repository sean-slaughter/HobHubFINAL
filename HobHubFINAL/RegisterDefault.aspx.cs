using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; // access to the Web.Config

namespace HobHubFINAL
{
    public partial class RegisterDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // need to check if user is registered then add if not 
            Boolean upperFlag = false;
            Boolean numberFlag = false;


            // vaild username check 
            if (txtUserName.Text.Length < 6)
            {
                Response.Write("Username must be 6 charecters or longer");
                return;
            }

            //valid password check 
            //uppercase letter, number, and at least 6 characters
            char[] passwordArray = txtPassword.Text.ToCharArray();

            for (int x = 0; x < passwordArray.Length; x++)
            {
                if (passwordArray[x] >= 65 && passwordArray[x] <= 90) //check for upper
                    upperFlag = true;
                if (passwordArray[x] >= 48 && passwordArray[x] <= 57) //check for number
                    numberFlag = true;
            }

            if (txtPassword.Text.Length < 6)
            {

                Response.Write( "Password must be 6 charecters or longer");
                return;
            }
            else if (!upperFlag)
            {

                Response.Write("Password must contain an uppercase letter");
                return;
            }
            else if (!numberFlag)
            {

                Response.Write("Password must contain a number");
                return;
            }
            else
            {
                SqlCommand cmd;
                string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);
                string sql = "SELECT [UserName] FROM [Users] WHERE [UserName] = '" + txtUserName.Text+"'";
                string value = string.Empty;
                try
                {
                    conn.Open();
                    cmd = new SqlCommand(sql, conn);
                    value = Convert.ToString(cmd.ExecuteScalar());
                    cmd.Dispose();
                    Response.Write("Returned username: " + value.ToString());
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
                // checking if username is used 
                if (!value.Equals(String.Empty))
                {
                    Response.Write("Username already in use. Please select a different username or log in.");
                    return;
                }


                // if not continue with registartion 
                conn = null;
                try
                {
                     connString =
                    ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    conn = new SqlConnection(connString);
                    String query = String.Format("INSERT INTO [Users] ([UserName], [Password]) VALUES('{0}', '{1}')", txtUserName.Text, txtPassword.Text);
                     cmd = new SqlCommand(query, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // handle error here
                   Response.Write("Error: " + ex.Message);
                    return;
                }
                finally
                {
                    conn.Close();
                }
                //reg done to login page 
                Response.Redirect("LoginDefault2.0.aspx");
            }



        }
    }
}