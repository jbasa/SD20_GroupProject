<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="RoomBookingSystem.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-4">
        <asp:DropDownList ID="ddlFloor" runat="server"></asp:DropDownList>

        <asp:DropDownList ID="ddlCapacity" runat="server">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>40+</asp:ListItem>
        </asp:DropDownList>
    

        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </div>
    <div class="col-md-4">
        <asp:GridView ID="gvAvailableRooms" AutoGenerateColumns="false" Visible="false" runat="server">
            <Columns>
                <asp:BoundField DataField="FloorNumber" HeaderText="Floor #" />
                <asp:BoundField DataField="RoomName" HeaderText="Room Name" />
                <asp:BoundField DataField="NumberOfChairs" HeaderText="Capacity" />
                <asp:ButtonField ButtonType="Button" Text="Book" CommandName="book" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

