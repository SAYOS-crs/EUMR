using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;

public class WorkTable
{
    private SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    
    private SqlCommand cmd = new SqlCommand();

    public string InsUpDel(string statement)
    {
        try
        {
            connection.Open();
            cmd = new SqlCommand(statement, connection);
            cmd.ExecuteNonQuery();
            return "Success";
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
        finally
        {
            connection.Close();
        }
    }

    public DataTable Select(string statement)
    {
        DataTable dt = new DataTable();
        try
        {
            connection.Open();
            cmd = new SqlCommand(statement, connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            // يمكن هنا تسجيل الخطأ أو throw
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {
            connection.Close();
        }
        return dt;
    }
}
