using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW2_AD
{
    public partial class category : System.Web.UI.Page
    {
        //checks the user login status and if not redirects to login page 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }
        }

        protected void Add_category_Click(object sender, EventArgs e)
        {
            //checking if the fields are empty

            if (cat_id.Text.Equals("")) { return; }
            DataView dataView = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            Response.Write(dataView.Table.Rows.Count);
            bool duplicate = dataView.Table.Rows.Count > 0;

            // checking if the category with the ID already exists or not
            if (duplicate)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Category already exist');</script>");
            }
            else
            {
                // -----adjusting the data type and passing values to add new category--------//
                int ar = Int32.Parse(cat_age_restrict.SelectedValue);
                Add_Category(cat_id.Text, cat_name.Text, ar);
                Cat_view.DataBind();
            }

        }

        private void Add_Category(string id, string name, int ar)
        {
            //---------adding new category-------------//

            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "Insert INTO DVDCategory(CategoryNumber, CategoryDescription, AgeRestricted) " +
                "Values('" + id + "', '" + name + "', '" + ar + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}