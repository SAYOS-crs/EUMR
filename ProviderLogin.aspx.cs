using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class ProviderLogin : System.Web.UI.Page
{
    string conn = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string input = txtusername.Text.Trim();
        string password = txtpassword.Text.Trim();
        string providerType = hfProvider.Value;   // نوع البروڤايدر من HiddenField

        string connStr = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = @"
            SELECT hp.Provider_ID
            FROM Healthcare_Provider hp
            INNER JOIN Users u ON hp.User_ID = u.User_ID
            WHERE 
                (
                    u.Email = @input
                    OR 
                    hp.Provider_ID = CASE 
                                        WHEN ISNUMERIC(@input) = 1 
                                        THEN CAST(@input AS INT) 
                                        ELSE -1 
                                     END
                )
                AND u.PasswordHash = @pass
                AND hp.Provider_Type = @ptype";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@input", input);
            cmd.Parameters.AddWithValue("@pass", password);
            cmd.Parameters.AddWithValue("@ptype", providerType);

            con.Open();
            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                Session["ProviderID"] = result.ToString();
                // ==== Redirect based on Provider Type ====
                string redirectPage = "Default.aspx"; // الصفحة الافتراضية لو فيه خطأ
                switch (providerType.ToLower())
                {
                    case "hospital":
                        redirectPage = "Hospital.aspx";
                        break;
                    case "laboratory":
                        redirectPage = "Lab.aspx";
                        break;
                    case "radiology":
                        redirectPage = "Radiology.aspx";
                        break;
                }

                Response.Redirect(redirectPage);
            }
            else
            {
                lblMsg.Text = "Invalid Provider ID / Email or password";
            }
        }
    }

}
