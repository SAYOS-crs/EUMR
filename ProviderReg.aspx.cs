using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class ProviderReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // قراءة البيانات من الفورم
        string providerType = ""; // سيتم تخزين النوع المحدد من الجافاسكربت
        if (Request.Form["selectedProvider"] != null)
            providerType = Request.Form["selectedProvider"];

        // هنا استخدمنا .Value لأخذ النصوص
        string facility = facilityName.Value.Trim();
        string license = licenseNumber.Value.Trim();
        string facilityAddress = address.Value.Trim();
        string phoneStr = phone.Value.Trim();
        string emailAddr = email.Value.Trim();
        string facilitySpecialization = specialization.Value.Trim();

        string adminNameVal = adminName.Value.Trim();
        string adminEmailVal = adminEmail.Value.Trim();
        string usernameVal = username.Value.Trim();
        string passwordVal = password.Value.Trim();

        string connStr = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // 1- إدخال المستخدم أولًا في جدول Users
                string insertUserQuery = @"INSERT INTO Users (UserName, PasswordHash, Email, CreatedAt) 
                                       OUTPUT INSERTED.User_ID
                                       VALUES (@UserName, @PasswordHash, @Email, @CreatedAt)";

                SqlCommand cmdUser = new SqlCommand(insertUserQuery, conn);
                cmdUser.Parameters.AddWithValue("@UserName", usernameVal);
                cmdUser.Parameters.AddWithValue("@PasswordHash", passwordVal); // الأفضل تشفير
                cmdUser.Parameters.AddWithValue("@Email", adminEmailVal);
                cmdUser.Parameters.AddWithValue("@CreatedAt", DateTime.Now);

                int newUserId = (int)cmdUser.ExecuteScalar(); // الحصول على User_ID الجديد

                // 2- إدخال البيانات في جدول Healthcare_Provider
                string insertProviderQuery = @"INSERT INTO Healthcare_Provider 
                                           (Name, Address, Phone, Provider_Type, License_Number, Email, User_ID)
                                           VALUES (@Name, @Address, @Phone, @ProviderType, @LicenseNumber, @Email, @UserID)";

                SqlCommand cmdProvider = new SqlCommand(insertProviderQuery, conn);
                cmdProvider.Parameters.AddWithValue("@Name", facility);
                cmdProvider.Parameters.AddWithValue("@Address", facilityAddress);
                cmdProvider.Parameters.AddWithValue("@Phone", phoneStr);
                cmdProvider.Parameters.AddWithValue("@ProviderType", providerType);
                cmdProvider.Parameters.AddWithValue("@LicenseNumber", license);
                cmdProvider.Parameters.AddWithValue("@Email", emailAddr);
                cmdProvider.Parameters.AddWithValue("@UserID", newUserId);

                cmdProvider.ExecuteNonQuery();

                conn.Close();

                // نجاح التسجيل
                Response.Write("<script>alert('Registration successful!'); window.location='Home.aspx';</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
        }
    }

}
