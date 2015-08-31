<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="RoomBookingSystem.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-md-9">
            <div class="page-header">
                <h1>Admin<small> CRUD for Booked Classrooms</small></h1>
            </div>
            <div class="panel panel-primary">
                <div class="panel-body">
                    <asp:GridView ID="GVAdminBooking" AutoGenerateColumns="False" DataKeyNames="BookingID" OnRowCommand="GVAdminBooking_RowCommand" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Room ID" DataField="RoomID" />
                            <asp:BoundField HeaderText="Room Name" DataField="RoomName" />
                            <asp:BoundField HeaderText="Number OF Chairs" DataField="NumberOfChairs" />
                            <asp:BoundField HeaderText="Booking ID" DataField="BookingID" />
                            <asp:BoundField HeaderText="Start Time" DataField="StartTime" />
                            <asp:BoundField HeaderText="End Time" DataField="EndTime" />
                            <asp:BoundField HeaderText="User ID" DataField="UserID" />
                            <asp:BoundField HeaderText="User Name" DataField="FullName" />
                            <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="del" ControlStyle-CssClass="btn btn-default" />
                            <asp:ButtonField Text="Update" ButtonType="Button" CommandName="upd" ControlStyle-CssClass="btn btn-default" />
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
                    <asp:Button ID="ButtInsertRoom" runat="server" Text="Add Room" OnClick="ButtInsertRoom_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="panel-heading"><h1>Add Classroom</h1></div>
            <div class="panel panel-primary">
                <asp:Panel ID="PanAddRoom" Visible="false" runat="server">
                    <h5>Room Name</h5>
                    <asp:TextBox ID="txtRoomName" runat="server"></asp:TextBox>
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
                    <h5>Name</h5>
                    <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>
                    <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" CssClass="btn btn-default" />
                </asp:Panel>
            </div>
        </div>
    </div>



    <asp:Panel ID="Admin" runat="server">
    </asp:Panel>
</asp:Content>
