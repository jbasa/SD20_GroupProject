<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="RoomBookingSystem.AdminUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlLeft" runat="server">
    <asp:GridView ID="gvUsers" PageSize="12" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvUsers_PageIndexChanging" DataKeyNames="UserID" OnRowCommand="gvUsers_RowCommand" runat="server">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="User ID" />
            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Password" HeaderText="Password" />
            <asp:BoundField DataField="SecurityLevel" HeaderText="Security Level" />
            <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="del" />
            <asp:ButtonField ButtonType="Button" Text="Update" CommandName="upd" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnInsert" runat="server" Text="Create New User" OnClick="btnInsert_Click" />
        </asp:Panel>
    <asp:Panel ID="pnlRight" Visible="false" runat="server">
        <asp:ValidationSummary ID="valSummary" runat="server" />
        <table>
            <tr>
                <td>
                    Full Name:
                </td>
                <td>
                    <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valrfFullName" runat="server" ErrorMessage="Full Name Required" EnableClientScript="False" ControlToValidate="txtFullName" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" TextMode="Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valrfEmail" runat="server" ErrorMessage="Email Required" EnableClientScript="False" ControlToValidate="txtEmail" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valrfPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
                <td>
                    <asp:Button ID="btnSave" Visible="false" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnUpdate" Visible="false" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
