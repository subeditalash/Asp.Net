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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks the user login status and if not redirects to login page 

            if (Session["UserName"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }
        }

        protected void Add_actor_Click(object sender, EventArgs e)
        {
            //checking if the fields are empty
            if (actor_id.Text.Equals("")) { return; }
            DataView dataView = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            Response.Write(dataView.Table.Rows.Count);
            bool duplicate = dataView.Table.Rows.Count > 0;

            // checking if the actor with the ID already exists or not
            if (duplicate)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Actor already exist');</script>");
            }
            else
            {
                // calling method to add actor
                Add_Actor(actor_id.Text, actor_ln.Text, actor_fn.Text);
                Actor_view.DataBind();
            }
        }

        private void Add_Actor(string id, string lname, string fname)       //method to add new actor
        {
            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "Insert INTO Actor(ActorNumber, ActorSurName, ActorFirstName) " +
                "Values('" + id + "', '" + lname + "', '" + fname + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}