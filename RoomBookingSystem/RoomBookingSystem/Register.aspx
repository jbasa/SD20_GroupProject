﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RoomBookingSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Full Name:
            </td>
            <td>
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email:
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password:
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Re Enter Password:
            </td>
            <td>
                <asp:TextBox ID="txtReEnterPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
