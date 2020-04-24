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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection conn;
        
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //update corner profile icon
            
            //get userid and item id
            int userID = Convert.ToInt32(Request.Cookies["UserID"].Value);
            int itemID = -1;
            if (Request.QueryString["item"] != null)
            {
                itemID = Convert.ToInt32(Request.QueryString["item"]);
            }
            conn = null;

            //get data for item
            try
            {
                string itemQuery = "SELECT * FROM Item WHERE UserID = " + userID +
                    " AND ItemID = " + itemID;
                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(itemQuery, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Object[] itemInfo = new Object[dr.FieldCount];
                    dr.GetValues(itemInfo);

                    //fill page with item info
                    lblItemName.Text = itemInfo[3].ToString();
                    lblDescription.Text = itemInfo[4].ToString();

                    //display photos
                    Image[] placeHolders = { imgItem1, imgItem2, imgItem3, imgItem4 };
                    for(int i = 0, j = 5; i < 5; i++, j++)
                    {
                        if(itemInfo[j].ToString() != String.Empty)
                        {
                            byte[] photoBytes = (byte[])itemInfo[j];
                            string base64 = Convert.ToBase64String(photoBytes);
                            placeHolders[i].ImageUrl = "data:Image/png;base64," + base64;
                            placeHolders[i].Width = 250;
                            placeHolders[i].Height = 250;
                            placeHolders[i].Style.Add("border-radius" , "5%");
                        }
                    }

                }
            
            }

            catch(Exception ex)
            {
                lblDescription.Text = "Error loading item data." + ex.Message;
            }
            finally
            {
                conn.Close();
            }

           

        }
        
    }
}