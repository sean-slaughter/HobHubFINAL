using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// ADO.NET – Add the following .NET Library References to the
// top section of your class file
using System.Data;
using System.Data.SqlClient;
using System.Configuration; // access to the Web.Config

namespace HobHubFINAL
{
    public partial class RegisterDefault2__0 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;

            //input val username
            if (txtUserName.Text == string.Empty)
            {
                lblError.Text = "Please do not leave username blank.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }
                        
            if(txtUserName.Text.Length < 6)
            {
                lblError.Text = "Please enter a username that is at least 6 characters long.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }

            //input val password
            if(txtPassword.Text == string.Empty)
            {
                lblError.Text = "Please do not leave password blank.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }

            if (txtPassword.Text.Length < 6)
            {
                lblError.Text = "Please enter a password that is at least 6 characters long.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }

            if(!(txtPassword.Text.Any(char.IsUpper) &&
                txtPassword.Text.Any(char.IsDigit) &&
                txtPassword.Text.Any(char.IsLower)))
            {
                lblError.Text = "Please enter a password with an uppercase letter, lowercase letter, and a number," +
                    " that is at least 6 characters long.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }

            SqlCommand cmd;
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            string sql = "SELECT [UserName] FROM [Users] WHERE [UserName] = '" + txtUserName.Text + "'";
            string value = string.Empty;
            try
            {
                conn.Open();
                cmd = new SqlCommand(sql, conn);
                value = Convert.ToString(cmd.ExecuteScalar());
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
            // checking if username is used 
            if (!value.Equals(String.Empty))
            {
                lblError.Text="Username already in use. Please select a different username or log in.";
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
               lblError.Text="Error: " + ex.Message;
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
