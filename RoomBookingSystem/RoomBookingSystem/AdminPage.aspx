<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="RoomBookingSystem.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <%--make drop down list for rooms and users--%>
        <div class="col-md-9">
            <div class="page-header">
                <h1>Admin<small> CRUD for Booked Classrooms</small></h1>
            </div>
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
                    <asp:Button ID="ButtInsertBooking" runat="server" Text="Add Booking" OnClick="ButtInsertRoom_Click" CssClass="btn btn-default" />
                </div>
        </div>

        <div class="col-md-3">
            <div class="panel-heading">
                <h1><asp:Label ID="lblClassroomInfo" runat="server" Text="Classroom Info" Visible="false"></asp:Label></h1>
            </div>
                <asp:Panel ID="PanAddRoom" Visible="false" runat="server">
                    <table>
                        <tr>
                            <td>
                                <h5>Room Name</h5>
                            </td>
                            <td>
                                <asp:DropDownList ID="DDLRoom" runat="server"></asp:DropDownList></td>
                        </tr>
                        <asp:Panel ID="PanCapacity" runat="server" Visible="false">
                            <tr>
                                <td>
                                    <h5>Capacity</h5>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCapacity" runat="server">
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>40+</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                        </asp:Panel>
                        <tr>
                            <td>
                                <h5>Date</h5>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server" type="date"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <h5>Start Time</h5>
                            </td>
                            <td>
                                <asp:TextBox ID="txtStartTime" runat="server" type="time"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <h5>End Time</h5>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEndTime" runat="server" type="time"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <h5>Name</h5>
                            </td>
                            <td>
                                <asp:DropDownList ID="DDLUsers" runat="server"></asp:DropDownList><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" /></td>
                            <td>
                                <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" CssClass="btn btn-default" /></td>
                            <td>
                                <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-default" /></td>
                        </tr>
                    </table>
                </asp:Panel>
        </div>
    </div>

    <div class="container-fluid">
        <div class="col-md-9">
                <asp:GridView ID="GVRooms" runat="server" AutoGenerateColumns="false" DataKeyNames="RoomID" OnRowCommand="GVRooms_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="RoomId" DataField="RoomID" />
                        <asp:BoundField HeaderText="Room Name" DataField="RoomName" />
                        <asp:BoundField HeaderText="Number Of Seats" DataField="NumberOfChairs" />
                        <asp:BoundField HeaderText="Floor" DataField="FloorNumber" />
                        <asp:BoundField HeaderText="Start Time" DataField="StartTime" />
                        <asp:BoundField HeaderText="End Time" DataField="EndTime" />
                        <asp:ButtonField ButtonType="Button" CommandName="Del" Text="Delete" />
                        <asp:ButtonField ButtonType="Button" CommandName="Upd" Text="Update" />
                    </Columns>
                </asp:GridView>
                <asp:Button ID="BtnInsertRoom" runat="server" Text="Add Room" OnClick="BtnInsertRoom_Click" CssClass="btn btn-default" />
        </div>
    </div>
    <asp:Panel ID="Admin" runat="server">
    </asp:Panel>
</asp:Content>
