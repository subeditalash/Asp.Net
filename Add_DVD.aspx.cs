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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //checks the user login status and if not redirects to login page 
            if (Session["UserName"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }
        }

        protected void Add_dvd_Click(object sender, EventArgs e)
        {
            //checking if the fields are empty

            if (dvd_id.Text.Equals("")) { return; }
            DataView dataView = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            Response.Write(dataView.Table.Rows.Count);
            bool duplicate = dataView.Table.Rows.Count > 0;

            // checking if the stdvdudio with the same ID already exists
            if (duplicate)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('DVD already exist');</script>");
            }
            else
            {
                // calling method to add dvd and instantly updating in the gridview
                Add_DVD(dvd_id.Text, Cat_name.SelectedValue, studio_name.SelectedValue, producer_name.SelectedValue, dvd_name.Text, release_date.Text, Convert.ToInt32(std_chrg.Text), Convert.ToInt32(pen_chrg.Text), Convert.ToInt32(total_copies.Text));
                Response.Write("<script LANGUAGE='JavaScript' >alert('DVD added!');window.location='Home.aspx';</script>");
                DVD_details.DataBind();
            }
        }

        private void Add_DVD(string id, string cat_id, string std_id, string pr_id, string name, string dater, int fee, int charge, int copy)
        {
            //adding new DVD to the database.

            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "Insert INTO DVDTitle(DVDNumber, CategoryNumber, StudioNumber, ProducerNumber, DVDTitle, DateReleased, StandardCharge, PenaltyCharge, AvailableCopies) " +
                "Values('" + id + "', '" + cat_id + "' , '" + std_id + "' , '" + pr_id + "' , '" + name + "' , '" + dater + "' , '" + fee + "' , '" + charge + "','" + copy +"')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}