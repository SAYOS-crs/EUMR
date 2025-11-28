using System;
using System.Data;

public class CPatient : WorkTable, BasicOperation
{
    private string _National_ID;
    private string _Name;
    private string _Gender;
    private string _Address;
    private string _Date_Of_Birth;
    private string _Phone;
    private string _Blood_type;
    private string _User_ID;

    private WorkTable db = new WorkTable();

    // ===============================
    // --------- Properties ----------
    // ===============================

    public string National_ID
    {
        get { return _National_ID; }
        set { _National_ID = value; }
    }

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    public string Gender
    {
        get { return _Gender; }
        set { _Gender = value; }
    }

    public string Address
    {
        get { return _Address; }
        set { _Address = value; }
    }

    public string Date_Of_Birth
    {
        get { return _Date_Of_Birth; }
        set { _Date_Of_Birth = value; }
    }

    public string Phone
    {
        get { return _Phone; }
        set { _Phone = value; }
    }

    public string Blood_type
    {
        get { return _Blood_type; }
        set { _Blood_type = value; }
    }

    public string User_ID
    {
        get { return _User_ID; }
        set { _User_ID = value; }
    }


    // =====================================================
    // ------------------ Add Patient ----------------------
    // =====================================================

    public string Add()
    {
        string sql = @"INSERT INTO Patient 
                        (National_ID, Name, Gender, Address, Date_Of_Birth, Phone, Blood_type, User_ID)
                        VALUES
                        (@National_ID, @Name, @Gender, @Address, @Date_Of_Birth, @Phone, @Blood_type, @User_ID)";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ---------------- Update Patient ---------------------
    // =====================================================

    public string Update()
    {
        string sql = @"UPDATE Patient SET 
                        Name = @Name,
                        Gender = @Gender,
                        Address = @Address,
                        Date_Of_Birth = @Date_Of_Birth,
                        Phone = @Phone,
                        Blood_type = @Blood_type,
                        User_ID = @User_ID
                       WHERE National_ID = @National_ID";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ---------------- Delete Patient ---------------------
    // =====================================================

    public string Delete()
    {
        string sql = "DELETE FROM Patient WHERE National_ID = @National_ID";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // --------------- Select All Patients -----------------
    // =====================================================

    public DataTable AllData()
    {
        string sql = "SELECT * FROM Patient";
        return db.Select(sql);
    }
}
