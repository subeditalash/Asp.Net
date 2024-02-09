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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks the user login status and if not redirects to login page 

            if (Session["UserName"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }
        }

        protected void Add_studio_Click(object sender, EventArgs e)
        {
            //checking if the fields are empty

            if (studio_id.Text.Equals("")) { return; }
            DataView dataView = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            Response.Write(dataView.Table.Rows.Count);
            bool duplicate = dataView.Table.Rows.Count > 0;

            // checking if the studio with the ID already exists or not

            if (duplicate)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Studio already exist');</script>");
            }
            else
            {

                // calling method to add studio

                Add_Studio(studio_id.Text, studio_name.Text);
                Studio_view.DataBind();
            }
        }

        private void Add_Studio(string id, string name) //method to add new studio
        {
            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "Insert INTO Studio(StudioNumber, StudioName) " +
                "Values('" + id + "', '" + name + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}