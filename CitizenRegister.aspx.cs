using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class CitizenRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string nationalID = txtNationalID.Text.Trim();
        string fullName = txtFullName.Text.Trim();
        string dob = txtDOB.Text.Trim();
        string phone = txtPhone.Text.Trim();
        string address = txtAddress.Text.Trim();
        string email = txtEmail.Text.Trim();
        string gender = ddlGender.SelectedValue;
        string bloodType = ddlBloodType.SelectedValue;

        string password = txtPassword.Text.Trim();
        string confirmPassword = txtConfirmPassword.Text.Trim();

        if (password != confirmPassword)
        {
            Response.Write("<script>alert('Passwords do not match');</script>");
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

        int userId;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();

            // 1️⃣ إضافة المستخدم في جدول Users و الحصول على User_ID تلقائيا
            string userQuery = @"
                INSERT INTO Users (UserName, PasswordHash, Email, CreatedAt)
                VALUES (@UserName, @PasswordHash, @Email, @CreatedAt);
                SELECT SCOPE_IDENTITY();
            ";

            SqlCommand cmdUser = new SqlCommand(userQuery, conn);
            cmdUser.Parameters.AddWithValue("@UserName", fullName);
            cmdUser.Parameters.AddWithValue("@PasswordHash", password);
            cmdUser.Parameters.AddWithValue("@Email", email);
            cmdUser.Parameters.AddWithValue("@CreatedAt", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

            userId = Convert.ToInt32(cmdUser.ExecuteScalar());

            // 2️⃣ إضافة بيانات المريض في جدول Patient
            string patientQuery = @"
                INSERT INTO Patient
                (National_ID, Name, Gender, Address, Date_Of_Birth, Phone, Blood_type, User_ID)
                VALUES
                (@NationalID, @Name, @Gender, @Address, @DOB, @Phone, @BloodType, @UserID)
            ";

            SqlCommand cmdPatient = new SqlCommand(patientQuery, conn);
            cmdPatient.Parameters.AddWithValue("@NationalID", nationalID);
            cmdPatient.Parameters.AddWithValue("@Name", fullName);
            cmdPatient.Parameters.AddWithValue("@Gender", gender);
            cmdPatient.Parameters.AddWithValue("@Address", address);
            cmdPatient.Parameters.AddWithValue("@DOB", dob);
            cmdPatient.Parameters.AddWithValue("@Phone", phone);
            cmdPatient.Parameters.AddWithValue("@BloodType", bloodType);
            cmdPatient.Parameters.AddWithValue("@UserID", userId);

            cmdPatient.ExecuteNonQuery();

            conn.Close();
        }

        Response.Write("<script>alert('Registration successful!'); window.location='Login.aspx';</script>");
    }
}
