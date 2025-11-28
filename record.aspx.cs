using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Record : System.Web.UI.Page
{
    // الاتصال بقاعدة البيانات
    string conn = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // جلب National_ID من Session
            string nationalID = Session["NationalID"] as string;

            if (string.IsNullOrEmpty(nationalID))
            {
                // لو مش مسجل دخول، حوله لصفحة Login
                Response.Redirect("Login.aspx");
                return;
            }

            // تحميل بيانات المريض
            LoadPatientData(nationalID);
        }
    }

    // =================================
    // تحميل بيانات المريض
    // =================================
    private void LoadPatientData(string nationalID)
    {
        using (SqlConnection con = new SqlConnection(conn))
        {
            string query = @"SELECT P.National_ID, P.Name, P.Gender, P.Address, P.Date_Of_Birth, 
                                    P.Phone, P.Blood_type, U.Email
                             FROM Patient P
                             INNER JOIN Users U ON P.User_ID = U.User_ID
                             WHERE P.National_ID = @nid";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nid", nationalID);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                fullName.Text = dr["Name"].ToString();
                gender.Text = dr["Gender"].ToString();
                address.Text = dr["Address"].ToString();
                dateOfBirth.Text = Convert.ToDateTime(dr["Date_Of_Birth"]).ToString("yyyy-MM-dd");
                phone.Text = dr["Phone"].ToString();
                bloodType.Text = dr["Blood_type"].ToString();
                email.Text = dr["Email"].ToString();
                this.nationalId.Text = dr["National_ID"].ToString();

                // حساب العمر تلقائي
                DateTime dob = Convert.ToDateTime(dr["Date_Of_Birth"]);
                age.Text = (DateTime.Now.Year - dob.Year - (DateTime.Now.DayOfYear < dob.DayOfYear ? 1 : 0)).ToString();
            }
            else
            {
                Response.Write("<script>alert('Patient not found');</script>");
            }
        }
    }

    // =================================
    // تحديث بيانات المريض
    // =================================
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string nationalID = this.nationalId.Text;

        using (SqlConnection con = new SqlConnection(conn))
        {
            string query = @"UPDATE Patient 
                             SET Name=@Name, Gender=@Gender, Address=@Address,
                                 Date_Of_Birth=@DOB, Phone=@Phone, Blood_type=@Blood
                             WHERE National_ID=@NID";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", fullName.Text);
            cmd.Parameters.AddWithValue("@Gender", gender.Text);
            cmd.Parameters.AddWithValue("@Address", address.Text);
            cmd.Parameters.AddWithValue("@DOB", dateOfBirth.Text);
            cmd.Parameters.AddWithValue("@Phone", phone.Text);
            cmd.Parameters.AddWithValue("@Blood", bloodType.Text);
            cmd.Parameters.AddWithValue("@NID", nationalID);

            con.Open();
            int rows = cmd.ExecuteNonQuery();

            if (rows > 0)
                Response.Write("<script>alert('Updated successfully');</script>");
            else
                Response.Write("<script>alert('Update failed');</script>");
        }
    }
}
