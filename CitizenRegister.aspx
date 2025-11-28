<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CitizenRegister.aspx.cs" Inherits="CitizenRegister" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Citizen Registration</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f4f7; }
        .container { width: 400px; margin: 50px auto; background: #2d8ad1; padding: 30px; border-radius: 20px; color: #fff; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input, select { width: 100%; padding: 10px; border-radius: 10px; border: none; }
        .btn-primary { width: 100%; padding: 15px; border: none; border-radius: 15px; background: #74a7dd; color: #fff; font-weight: bold; cursor: pointer; }
        .btn-primary:hover { background: #3fac6b; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Create Citizen Account</h2>

            <div class="form-group">
                <label for="txtNationalID">National ID</label>
                <asp:TextBox ID="txtNationalID" runat="server" placeholder="Enter National ID" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtFullName">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter Full Name" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtDOB">Date of Birth</label>
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtPhone">Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter Phone Number" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtAddress">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter Address" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email" TextMode="Email" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="ddlGender">Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlBloodType">Blood Type</label>
                <asp:DropDownList ID="ddlBloodType" runat="server">
                    <asp:ListItem Value="A+">A+</asp:ListItem>
                    <asp:ListItem Value="O+">O+</asp:ListItem>
                    <asp:ListItem Value="B+">B+</asp:ListItem>
                    <asp:ListItem Value="AB+">AB+</asp:ListItem>
                    <asp:ListItem Value="A-">A-</asp:ListItem>
                    <asp:ListItem Value="O-">O-</asp:ListItem>
                    <asp:ListItem Value="B-">B-</asp:ListItem>
                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter Password" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtConfirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" required></asp:TextBox>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-primary" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>
