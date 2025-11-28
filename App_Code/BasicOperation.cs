using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;

public interface BasicOperation
{

    string Add();
    string Update();
    string Delete();
    DataTable AllData();
}