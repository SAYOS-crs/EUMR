using System;
using System.Data;



public class CUsers : WorkTable, BasicOperation
{
    private string _User_ID;
    private string _UserName;
    private string _PasswordHash;
    private string _Email;
    private string _CreatedAt;
    private string _LastLogin;

    private WorkTable db = new WorkTable();

    // ===============================
    // --------- Properties ----------
    // ===============================

    public string User_ID
    {
        get { return _User_ID; }
        set { _User_ID = value; }
    }

    public string UserName
    {
        get { return _UserName; }
        set { _UserName = value; }
    }

    public string PasswordHash
    {
        get { return _PasswordHash; }
        set { _PasswordHash = value; }
    }

    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }

    public string CreatedAt
    {
        get { return _CreatedAt; }
        set { _CreatedAt = value; }
    }

    public string LastLogin
    {
        get { return _LastLogin; }
        set { _LastLogin = value; }
    }


    // =====================================================
    // ------------------ Add User -------------------------
    // =====================================================

    public string Add()
    {
        string sql = @"INSERT INTO Users (UserName, PasswordHash, Email, CreatedAt, LastLogin)
                         VALUES (@UserName, @PasswordHash, @Email, @CreatedAt, @LastLogin)";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ------------------ Update User ----------------------
    // =====================================================

    public string Update()
    {
        string sql = @"UPDATE Users SET 
                            UserName = @UserName,
                            PasswordHash = @PasswordHash,
                            Email = @Email,
                            LastLogin = @LastLogin
                         WHERE User_ID = @User_ID";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ------------------ Delete User ----------------------
    // =====================================================

    public string Delete()
    {
        string sql = "DELETE FROM Users WHERE User_ID = @User_ID";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ------------------ Select All Users -----------------
    // =====================================================

    public DataTable AllData()
    {
        string sql = "SELECT * FROM Users";
        return db.Select(sql);
    }
}
