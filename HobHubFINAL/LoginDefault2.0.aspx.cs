using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; 
namespace HobHubFINAL
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Text = string.Empty;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Boolean upperFlag = false;
            Boolean numberFlag = false;


            // vaild username check 
            if (txtUsername.Text.Length < 6)
            {
                lblErrorMessage.Text = "Username must be 6 charecters or longer";
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

                lblErrorMessage.Text = "Password must be 6 charecters or longer";
                return;
            }
            else if (!upperFlag)
            {

                lblErrorMessage.Text = "Password must contain an uppercase letter";
                return;
            }
            else if (!numberFlag)
            {

                lblErrorMessage.Text = "Password must contain a number";
                return;
            }
            else
            {
                //Database check for UN/PW goes here
                // Username password Check

                // get password for give username
                SqlCommand cmd;
                string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);
                string sql = "SELECT [Password] FROM [Users] WHERE [UserName] = '" + txtUsername.Text + "'";
                String value = string.Empty;
                try
                {
                    conn.Open();
                    cmd = new SqlCommand(sql, conn);
                    value = Convert.ToString(cmd.ExecuteScalar());
                    cmd.Dispose();
                    // TODO:  Remove this 
                    lblErrorMessage.Text="Returned TweetId: " + value.ToString();
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Error: " + ex.Message;
                }
                finally
                {
                    conn.Close();
                }
                value = value.Trim(' ');
                if (!value.Equals(txtPassword.Text))
                {
                    lblErrorMessage.Text = "Invalid Username or Password";
                    return;
                }
                else
                {
                    //login done to main page with cookie
                    // get user id
                     connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                     conn = new SqlConnection(connString);
                     sql = "SELECT [UserID] FROM [Users] WHERE [UserName] = '" + txtUsername.Text + "'";
                     int val=-1;
                    try
                    {
                        conn.Open();
                        cmd = new SqlCommand(sql, conn);
                        val = Convert.ToInt32(cmd.ExecuteScalar());
                        cmd.Dispose();
                        // TODO:  Remove this 
                        lblErrorMessage.Text = "Returned TweetId: " + value.ToString();
                    }
                    catch (Exception ex)
                    {
                        lblErrorMessage.Text = "Error: " + ex.Message;
                    }
                    finally
                    {
                        conn.Close();
                    }
                    // put user id in cookie(-1) if something went wrong 
                    Response.Cookies["UserID"].Value = (val.ToString());

                    Response.Redirect("UserProfileDefault.aspx");
                }
            }
        }
    }
}