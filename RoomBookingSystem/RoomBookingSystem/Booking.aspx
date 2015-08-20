<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="RoomBookingSystem.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="col-md-6">
        <table>
            <tr>
                <td>
                    <h5>Floor</h5>
                    <asp:DropDownList ID="ddlFloor" runat="server">
                    </asp:DropDownList></td>
                <td>
                    <h5>Capacity</h5>
                    <asp:DropDownList ID="ddlCapacity" runat="server">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40+</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                    <h5 class="text-center">Date</h5>
                    <asp:TextBox ID="txtDate" runat="server" type="date"></asp:TextBox></td>
                <td>
                    <h5>Start Time</h5>
                    <asp:TextBox ID="txtStartTime" runat="server" type="time"></asp:TextBox>
                </td>
                <td>
                    <h5>End Time</h5>
                    <asp:TextBox ID="txtEndTime" runat="server" type="time"></asp:TextBox></td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /></td>
            </tr>
        </table>

    </div>


    <div class="col-md-6">
        <asp:GridView ID="gvAvailableRooms" AutoGenerateColumns="false" Visible="false" runat="server" OnRowCommand="gvAvailableRooms_RowCommand">
            <Columns>
                <asp:BoundField DataField="FloorNumber" HeaderText="Floor #" />
                <asp:BoundField DataField="RoomName" HeaderText="Room Name" />
                <asp:BoundField DataField="NumberOfChairs" HeaderText="Capacity" />
                <asp:BoundField DataField="StartTime" HeaderText="From" />
                <asp:BoundField DataField="EndTime" HeaderText="To" />
                <asp:ButtonField ButtonType="Button" Text="Book" CommandName="book" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

