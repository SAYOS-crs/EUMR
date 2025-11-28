using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;

public class CRadiology_Image : WorkTable, BasicOperation
{
    private string _Radiology_ID;
    private string _File_Name;
    private string _File_Path;
    private string _Record_ID;

    public string Radiology_ID
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string File_Name
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string File_Path
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string Record_ID
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string Add()
    {
        throw new NotImplementedException();
    }

    public string Update()
    {
        throw new NotImplementedException();
    }

    public string Delete()
    {
        throw new NotImplementedException();
    }

    public DataTable AllData()
    {
        throw new NotImplementedException();
    }
}