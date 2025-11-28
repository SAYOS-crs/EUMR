using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    string conn = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("CitizenRegister.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string input = txtusername.Text.Trim();
        string password = txtpassword.Text.Trim();

        using (SqlConnection con = new SqlConnection(conn))
        {
            string query = @"
                SELECT p.National_ID
                FROM Patient p
                INNER JOIN Users u ON p.User_ID = u.User_ID
                WHERE (u.Email = @input OR p.National_ID = @input)
                AND u.PasswordHash = @pass";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@input", input);
            cmd.Parameters.AddWithValue("@pass", password);

            con.Open();
            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                // حفظ الـ National_ID في الـ Session
                Session["NationalID"] = result.ToString();

                // تحويل للصفحة الرئيسية
                Response.Redirect("Record.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid email/National ID or password";
            }
        }
    }
}
