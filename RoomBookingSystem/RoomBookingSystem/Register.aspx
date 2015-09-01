<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RoomBookingSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">

        <div class="col-md-12">
            <div class="page-header">
                <h1>Please Sign Up</h1>
            </div>
            <div class="panel panel-primary">
                <div class="panel-body">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
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
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valrfFullName" runat="server" ErrorMessage="Full Name Required" ControlToValidate="txtFullName" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valrfEmail" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valrfPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Re Enter Password:
                            </td>
                            <td>
                                <asp:TextBox ID="txtReEnterPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valrfReEnterPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="txtReEnterPassword" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="valcvPassword" runat="server" ErrorMessage="Password Doesn't Match" ControlToCompare="txtPassword" ControlToValidate="txtReEnterPassword" EnableClientScript="False" Text="*"></asp:CompareValidator>
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
