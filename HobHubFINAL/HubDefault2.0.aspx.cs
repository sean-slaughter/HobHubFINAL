using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
    }
}