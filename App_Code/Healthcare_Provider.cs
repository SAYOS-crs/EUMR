using System;
using System.Data;

public class CHealthcare_Provider : WorkTable, BasicOperation
{
    private string _Provider_ID;
    private string _Name;
    private string _Address;
    private string _Phone;
    private string _Provider_Type;
    private string _License_Number;
    private string _Email;
    private string _Specialization;
    private string _User_ID;

    private WorkTable db = new WorkTable();

    // ===============================
    // --------- Properties ----------
    // ===============================

    public string Provider_ID
    {
        get { return _Provider_ID; }
        set { _Provider_ID = value; }
    }

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    public string Address
    {
        get { return _Address; }
        set { _Address = value; }
    }

    public string Phone
    {
        get { return _Phone; }
        set { _Phone = value; }
    }

    public string Provider_Type
    {
        get { return _Provider_Type; }
        set { _Provider_Type = value; }
    }

    public string License_Number
    {
        get { return _License_Number; }
        set { _License_Number = value; }
    }

    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }

    public string Specialization
    {
        get { return _Specialization; }
        set { _Specialization = value; }
    }

    public string User_ID
    {
        get { return _User_ID; }
        set { _User_ID = value; }
    }

    // =====================================================
    // ------------------ Add Provider --------------------
    // =====================================================

    public string Add()
    {
        string sql = @"INSERT INTO Healthcare_Provider
                        (Name, Address, Phone, Provider_Type, License_Number, Email, Specialization, User_ID)
                        VALUES
                        (@Name, @Address, @Phone, @Provider_Type, @License_Number, @Email, @Specialization, @User_ID)";

        return db.InsUpDel(sql);
    }

    // =====================================================
    // ---------------- Update Provider -------------------
    // =====================================================

    public string Update()
    {
        string sql = @"UPDATE Healthcare_Provider SET
                        Name = @Name,
                        Address = @Address,
                        Phone = @Phone,
                        Provider_Type = @Provider_Type,
                        License_Number = @License_Number,
                        Email = @Email,
                        Specialization = @Specialization,
                        User_ID = @User_ID
                       WHERE Provider_ID = @Provider_ID";

        return db.InsUpDel(sql);
    }

    // =====================================================
    // ---------------- Delete Provider -------------------
    // =====================================================

    public string Delete()
    {
        string sql = "DELETE FROM Healthcare_Provider WHERE Provider_ID = @Provider_ID";
        return db.InsUpDel(sql);
    }

    // =====================================================
    // --------------- Select All Providers ---------------
    // =====================================================

    public DataTable AllData()
    {
        string sql = "SELECT * FROM Healthcare_Provider";
        return db.Select(sql);
    }
}
