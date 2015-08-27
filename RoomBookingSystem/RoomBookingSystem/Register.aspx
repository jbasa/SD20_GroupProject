﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RoomBookingSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/bootstrap-simplex.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>

    <div class="container-fluid">
       
        <div class="col-md-12">
            <div class="page-header">
                <h1>Please Sign Up</h1>
            </div>

            <div class="panel panel-primary">
                <div class="panel-body">
    <table>
        <tr>
            <td>Full Name:
            </td>
            <td>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="input-default"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email:
            </td>
            <td>
                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password:
            </td>
            <td>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Re Enter Password:
            </td>
            <td>
                <asp:TextBox ID="txtReEnterPassword" TextMode="Password" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn btn-success" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
