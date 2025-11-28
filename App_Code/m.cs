using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;

public class CMedical_Record : WorkTable, BasicOperation
{
    private string _Created_Date;
    private string _Last_Updated;
    private string _National_ID;
    private string _Provider_ID;
    private string _Record_ID;

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

    public string Created_Date
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string Last_Updated
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string National_ID
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string Provider_ID
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