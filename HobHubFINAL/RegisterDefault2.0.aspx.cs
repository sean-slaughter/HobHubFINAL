using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HobHubFINAL
{
    public partial class RegisterDefault2__0 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
           //input val first name
            if(txtFirstName.Text == string.Empty)
            {
                lblError.Text = "Please do not leave first name blank.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }

            Regex regex = new Regex("^[a-zA-Z]+$");
            
            if(!regex.IsMatch(txtFirstName.Text)){
                lblError.Text = "Please enter only upper and lower case letters.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }

            //input val last name
            if (txtLastName.Text == string.Empty)
            {
                lblError.Text = "Please do not leave last name blank.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }
                     
            if (!regex.IsMatch(txtLastName.Text)){
                lblError.Text = "Please enter only upper and lower case letters.";
                return;
            }
            else
            {
                lblError.Text = string.Empty;
            }

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




        }
    }
}