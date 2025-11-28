using System;
using System.Data;

public class CAttachment : WorkTable, BasicOperation
{
    private string _Attachment_ID;
    private string _File_Name;
    private string _File_Path;
    private string _Attachment_Type;
    private string _Description;
    private string _Upload_Date;
    private string _File_ID;
    private string _National_ID;

    private WorkTable db = new WorkTable();

    // ===============================
    // --------- Properties ----------
    // ===============================

    public string Attachment_ID
    {
        get { return _Attachment_ID; }
        set { _Attachment_ID = value; }
    }

    public string File_Name
    {
        get { return _File_Name; }
        set { _File_Name = value; }
    }

    public string File_Path
    {
        get { return _File_Path; }
        set { _File_Path = value; }
    }

    public string Attachment_Type
    {
        get { return _Attachment_Type; }
        set { _Attachment_Type = value; }
    }

    public string Description
    {
        get { return _Description; }
        set { _Description = value; }
    }

    public string Upload_Date
    {
        get { return _Upload_Date; }
        set { _Upload_Date = value; }
    }

    public string File_ID
    {
        get { return _File_ID; }
        set { _File_ID = value; }
    }

    public string National_ID
    {
        get { return _National_ID; }
        set { _National_ID = value; }
    }


    // =====================================================
    // ------------------ Add Attachment -------------------
    // =====================================================

    public string Add()
    {
        string sql = @"INSERT INTO Attachment
                       (File_Name, File_Path, Attachment_Type, Description, Upload_Date, File_ID, National_ID)
                       VALUES
                       (@File_Name, @File_Path, @Attachment_Type, @Description, @Upload_Date, @File_ID, @National_ID)";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ---------------- Update Attachment ------------------
    // =====================================================

    public string Update()
    {
        string sql = @"UPDATE Attachment SET
                        File_Name = @File_Name,
                        File_Path = @File_Path,
                        Attachment_Type = @Attachment_Type,
                        Description = @Description,
                        Upload_Date = @Upload_Date,
                        File_ID = @File_ID,
                        National_ID = @National_ID
                       WHERE Attachment_ID = @Attachment_ID";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ---------------- Delete Attachment ------------------
    // =====================================================

    public string Delete()
    {
        string sql = "DELETE FROM Attachment WHERE Attachment_ID = @Attachment_ID";

        return db.InsUpDel(sql);
    }


    // =====================================================
    // ---------------- Select All Attachments -------------
    // =====================================================

    public DataTable AllData()
    {
        string sql = "SELECT * FROM Attachment";
        return db.Select(sql);
    }
}
