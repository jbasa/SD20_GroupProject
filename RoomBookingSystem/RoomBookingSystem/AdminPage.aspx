<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="RoomBookingSystem.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Admin" runat="server">
        <asp:GridView ID="GVAdminBooking" AutoGenerateColumns="False" DataKeyNames="BookingID" OnRowCommand="GVAdminBooking_RowCommand"  runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField HeaderText="Start Time" DataField="StartTime" />
                <asp:BoundField HeaderText="End Time" DataField="EndTime" />
                <asp:BoundField HeaderText="UserID" DataField="UserID" />
                <asp:BoundField HeaderText="RoomID" DataField="RoomID" />
                <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="del" />
                <asp:ButtonField Text="Update" ButtonType="Button" CommandName="upd" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:Button ID="ButtInsertRoom" runat="server" Text="Add Room" OnClick="ButtInsertRoom_Click" />
        <asp:Panel ID="PanAddRoom" Visible="false" runat="server">
            <h5>Room Name</h5>
            <asp:TextBox ID="TxtRoomName" runat="server"></asp:TextBox>
                    <h5>Floor</h5>
                    <asp:DropDownList ID="ddlFloor" runat="server">
                    </asp:DropDownList>
                    <h5>Capacity</h5>
                    <asp:DropDownList ID="ddlCapacity" runat="server">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40+</asp:ListItem>
                    </asp:DropDownList>
                    <h5>Date</h5>
                    <asp:TextBox ID="txtDate" runat="server" type="date"></asp:TextBox>
                    <h5>Start Time</h5>
                    <asp:TextBox ID="txtStartTime" runat="server" type="time"></asp:TextBox>
                    <h5>End Time</h5>
                    <asp:TextBox ID="txtEndTime" runat="server" type="time"></asp:TextBox>
                    <asp:Button ID="btnadd" runat="server" Text="Search" OnClick="btnadd_Click" CssClass="btn btn-primary" />
                </asp:Panel>
    </asp:Panel>
</asp:Content>
