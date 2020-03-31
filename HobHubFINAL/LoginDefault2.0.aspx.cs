using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


                // go to hub page for now 
                //redirect code from page to page (not case sensitive)
                Response.Redirect("HubDefault2.0.aspx");
            }
        }
    }
}