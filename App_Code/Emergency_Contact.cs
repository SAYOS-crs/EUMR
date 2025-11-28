using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;

public class CEmergency_Contact : WorkTable, BasicOperation
{
    private string _Contact_ID;
    private string _Contact_Name;
    private string _Contact_Phone;
    private string _Relationship;
    private string _National_ID;

    public string Contact_ID
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string Contact_Name
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string Contact_Phone
    {
        get
        {
            throw new System.NotImplementedException();
        }

        set
        {
        }
    }

    public string Relationship
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