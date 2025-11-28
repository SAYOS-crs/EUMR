using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;

public class CLab_Results : WorkTable, BasicOperation
{
    private string _lab_ID;
    private string _File_name;
    private string _File_Path;
    private string _Record_ID;

    public string lab_ID
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string File_name
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