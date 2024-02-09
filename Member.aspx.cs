using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW2_AD
{
    public partial class Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks the user login status and if not redirects to login page 

            if (Session["UserName"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }
        }
        protected void btn_add_member_Click(object sender, EventArgs e)
        {
            //passing necessary data for member registration 

            AddMember(Member_fname.Text, Member_lname.Text, Membership_cat.SelectedValue, Member_address.Text, Member_dob.Text);
            Response.Write("<script LANGUAGE='JavaScript' >alert('Member added!');window.location='Home.aspx';</script>");
        }
        private void AddMember(string fname, string lname, string membership, string address, string dob)
        {
            //addming new members

            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "Insert INTO Member(MembershipCategoryNumber, MemberLastName, MemberFirstName, MemberAddress, MemberDateOfBirth) " +
                "Values('" + membership + "', '" + lname + "' , '" + fname + "' , '" + address + "' , '" + dob + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}