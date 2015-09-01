<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="RoomBookingSystem.AdminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-md-9">
            <div class="page-header">
                
                <h1>Admin<small> CRUD for Registered Users</small></h1>
            </div>
                <div class="panel-body">
                    <asp:Panel ID="pnlLeft" runat="server">
                        <asp:GridView ID="gvUsers" PageSize="12" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="gvUsers_PageIndexChanging" DataKeyNames="UserID" OnRowCommand="gvUsers_RowCommand" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:BoundField DataField="UserID" HeaderText="User ID" />
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Password" HeaderText="Password" />
                                <asp:BoundField DataField="SecurityLevel" HeaderText="Security Level" />
                                <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="del" ControlStyle-CssClass="btn btn-default" />
                                <asp:ButtonField ButtonType="Button" Text="Update" CommandName="upd" ControlStyle-CssClass="btn btn-default" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        <asp:Button ID="btnInsert" runat="server" Text="Create New User" OnClick="btnInsert_Click" CssClass="btn btn-default" />
                    </asp:Panel>
                </div>
        </div>

        <div class="col-md-3">
            <div class="panel-heading">
               <h1><asp:Label ID="lblUserInfoLabel" runat="server" Text="User Info" Visible="false"></asp:Label></h1>
            </div>
                <asp:Panel ID="pnlRight" Visible="false" runat="server">
                    <asp:ValidationSummary ID="valSummary" runat="server" />
                    <table>
                        <tr>
                            <td>Full Name:
                            </td>
                            <td>
                                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valrfFullName" runat="server" ErrorMessage="Full Name Required" EnableClientScript="False" ControlToValidate="txtFullName" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valrfEmail" runat="server" ErrorMessage="Email Required" EnableClientScript="False" ControlToValidate="txtEmail" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valrfPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Security Level</td>
                            <td><asp:DropDownList ID="ddlSecurityLevel" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                </asp:DropDownList></td>
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
            
        </div>
    </div>



</asp:Content>
