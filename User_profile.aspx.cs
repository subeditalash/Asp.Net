using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW2_AD
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks the user login status 

            if (Session["UserType"] != null)
            {
                //displaying function only accessible by their user type  

                if (Session["UserType"].ToString().ToLower().Contains("admin"))
                {
                    c_pass.Visible = false;
                    Confirm_pass.Visible = false;
                    update.Visible = false;
                }
                else if (Session["UserType"].ToString().ToLower().Contains("staff"))
                {
                    list_title.Visible = false;
                    user_view.Visible = false;
                    add_user.Visible = false;
                    user_name.Text = Session["UserName"].ToString();
                    Email.Text = Session["Email"].ToString();
                    //User_pass.Text = Session["UserPassword"].ToString();
                    DOB.Text = Session["DOB"].ToString();
                    user_name.ReadOnly = true;
                    Email.ReadOnly = true;
                    DOB.ReadOnly = true;
                    add_user.Visible = false;
                    user_type.Visible = false;
                }
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }


        }

        protected void user_view_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Add_user_Click(object sender, EventArgs e)
        {
            //passing values to the user adding method
            Add_User(user_name.Text, User_pass.Text, Email.Text, DOB.Text, user_type.SelectedValue);
            user_view.DataBind();
        }

        void Add_User(string name, string password, string email, string dob, string type)  //adding new user to the database
        {
            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "Insert INTO Users(UserName, UserPassword, Email, Date_of_Birth,  UserType) " +
                "Values('" + name + "', '" + password + "' , '" + email + "' , '" + dob + "' , '" + type + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void Update_Click(object sender, EventArgs e)
        {

            /*qlDataSource3.Update();*/
            if (User_pass.Text == Confirm_pass.Text)
            {
                //passing the updated value to the update method

                Update_user(Confirm_pass.Text, Email.Text);
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Password donot match!');window.location='Home.aspx';</script>");
            }
        }

        void Update_user(string ConfirmPass, string email)   //method to update user
        {
            string connectionString = @"Data Source = .\SqlExpress;" +
            "Database = RopeyDVDs;" +
            "Trusted_Connection = True;";
            string query = @"UPDATE Users SET UserPassword = '" + ConfirmPass + "' WHERE Email = '" + email + "'";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

        }
    }
}