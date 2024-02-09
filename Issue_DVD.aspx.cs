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
    public partial class WebForm4 : System.Web.UI.Page
    {
        DateTime start = DateTime.Today;
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks the user login status and if not redirects to login page 
            if (Session["UserName"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }

            DVDcopies.DataBind();
            Penalty_view.DataBind();
        }

        protected void show_data_Click(object sender, EventArgs e)
        {
            getNames(); 
            getdate();   
        }

        void getNames() //gets the selected member and dvd details
        {
            try
            {
                string connectionString = @"Data Source = .\SqlExpress;" +
               "Database = RopeyDVDs;" +
               "Trusted_Connection = True;";
                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("select DVDTitle from DVDTitle WHERE DVDNumber='" + dvd_id.SelectedValue + "'", connection);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    dvd_name.Text = dt.Rows[0]["DVDTitle"].ToString();  //getting dvd details
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book ID');</script>");
                }

                cmd = new SqlCommand("select MemberFirstName, MemberLastName, MemberDateOfBirth from Member WHERE MemberNumber='" + mem_id.SelectedValue + "'", connection);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    //getting member details
                    mem_fname.Text = dt.Rows[0]["MemberFirstName"].ToString();
                    mem_lname.Text = dt.Rows[0]["MemberLastName"].ToString();
                    dob_for_loan.Text = dt.Rows[0]["MemberDateOfBirth"].ToString();
                    Session["CurrentAge"] = dt.Rows[0]["MemberDateOfBirth"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Member ID');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); ;
            }
        }

        protected void membership_type_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void getdate()  // fills the date textboxes as per member loan type
        {
            if (loan_type.SelectedValue == "0")
            {
                DateTime start = DateTime.Today;
                DateTime end = DateTime.Today.AddDays(7);
                start_date.Text = start.ToString("MM/dd/yyyy");
                end_date.Text = end.ToString("MM/dd/yyyy");
            }
            else
            {
                DateTime start = DateTime.Today;
                DateTime end = DateTime.Today.AddDays(30);
                start_date.Text = start.ToString("MM/dd/yyyy");
                end_date.Text = end.ToString("MM/dd/yyyy");
            }
        }

        protected void btn_issue_loan_Click(object sender, EventArgs e)
        {
            int age = (DateTime.Parse(DateTime.Now.ToString("MM/dd/yyyy")).Year - DateTime.Parse(Session["CurrentAge"].ToString()).Year);
            if (age > 18)
            {
                //if user's age is greter than 18, issue loan 
                Issue_loan(loan_type.SelectedValue, DVDcopies.SelectedValue, Convert.ToInt32(mem_id.SelectedValue), start_date.Text, end_date.Text, dvd_id.SelectedValue);
                Response.Write("<script>alert('" + age + "');</script>");
                loan_view.DataBind();
                DVDcopies.DataBind();
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('" + age + "');</script>");
            }

        }
        void Issue_loan(string loantype, string copy, int mem_num, string dateout, string due, string dvd)
        {
            //storing the issued dvd loan details
            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "Insert INTO Loan(LoanTypeNumber, CopyNumber, MemberNumber, DateOut, DateDue, DVDNumber) " +
                "Values('" + loantype + "', '" + copy + "', '" + mem_num + "', '" + dateout + "', '" + due + "', '" + dvd + "')";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void btn_return_Click(object sender, EventArgs e)
        {

        }

        protected void search_loan_Click(object sender, EventArgs e)     //searches for the loan details
        {
            date_return_fr.Text = DateTime.Today.ToString("MM/dd/yyyy");
            Get_loan_details();           
        }

        void Get_loan_details() 
        {
            // gets the loan data if the loan number is available
            string connectionString = @"Data Source = .\SqlExpress;" +
           "Database = RopeyDVDs;" +
           "Trusted_Connection = True;";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand c = new SqlCommand("SELECT d.DVDTitle, l.CopyNumber, l.DateOut, l.Datedue, lt.LoanType, m.MemberFirstName, m.MemberLastName FROM Loan l JOIN DVDTitle d on d.DVDNumber = l.DVDNumber JOIN Member m ON l.MemberNumber = m.MemberNumber JOIN LoanType lt on l.LoanTypeNumber = lt.LoanTypeNumber WHERE l.LoanNumber = '" + loan_no.SelectedValue + "' ", connection);
            SqlDataAdapter d = new SqlDataAdapter(c);
            DataTable dta = new DataTable();
            d.Fill(dta);
            if (dta.Rows.Count >= 1)
            {
                // displaying loan details on their respective fields
                dvd_on_loan.Text = dta.Rows[0]["DVDTitle"].ToString();
                dvd_copy_on_loan.Text = dta.Rows[0]["CopyNumber"].ToString();
                loan_mem_fname.Text = dta.Rows[0]["MemberFirstName"].ToString();
                loan_mem_lname.Text = dta.Rows[0]["MemberLastName"].ToString();
                loan_type_of_mem.Text = dta.Rows[0]["LoanType"].ToString();
                date_loaned_fr.Text = dta.Rows[0]["DateOut"].ToString();
                date_due_fr.Text = dta.Rows[0]["Datedue"].ToString();
            }
            else
            {
                Response.Write("<script>alert('No loan details found');</script>");
            }
        }

        protected void return_save_Click(object sender, EventArgs e)
        {
            Return_loan();
            loan_view.DataBind();
        }

        void Return_loan()  //recording the dvd return date
        {
            string connectionString = @"Data Source = .\SqlExpress;" +
                "Database = RopeyDVDs;" +
                "Trusted_Connection = True;";
            string query = "UPDATE Loan SET DateReturned = '"+date_return_fr.Text+"' WHERE LoanNumber = '"+loan_no.SelectedValue+"' ";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}