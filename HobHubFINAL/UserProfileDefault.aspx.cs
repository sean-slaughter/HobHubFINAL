using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HobHubFINAL
{
    public partial class UserProfileDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEditItems_Click(object sender, EventArgs e)
        {

        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfileInformation.aspx");

        }
    }
}