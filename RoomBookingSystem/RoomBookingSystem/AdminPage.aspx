<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="RoomBookingSystem.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <%--make drop down list for rooms and users--%>
        <div class="col-md-9">
            <div class="page-header">
                <h1>Admin & Dashboard</h1>
            </div>
            <div class="panel-heading">
                <h1><small>CRUD for Booked Classrooms</small></h1>
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
                <h1>
                    <asp:Label ID="lblClassroomInfo" runat="server" Text="Classroom Info" Visible="false"></asp:Label></h1>
            </div>
            <asp:Panel ID="PanAddRoom" Visible="false" runat="server">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                <table>
                    <tr>
                        <td>
                            <h5>Room Name</h5>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLRoom" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>Date</h5>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" type="date"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="valrfDate" runat="server" ErrorMessage="Date Required" Text="*" ControlToValidate="txtDate" EnableClientScript="False"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td>
                            <h5>Start Time</h5>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStartTime" runat="server" type="time"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="valrfStartTime" runat="server" ErrorMessage="Start Time Required" EnableClientScript="False" ControlToValidate="txtStartTime" Text="*"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td>
                            <h5>End Time</h5>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEndTime" runat="server" type="time"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="valrfEndTime" runat="server" ErrorMessage="End Time Required" EnableClientScript="False" ControlToValidate="txtEndTime" Text="*"></asp:RequiredFieldValidator>
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
                            <asp:Button ID="BtnUpdateRoom" runat="server" Text="Update" Visible="false" OnClick="btnupdate_Click" CssClass="btn btn-default" />
                            <asp:Button ID="BtnAddRoom" runat="server" Visible="false" OnClick="btnadd_Click" Text="Add Booking" CssClass="btn btn-default" />
                        </td>
                        <td>
                            <asp:Button ID="BtnCancelBooking" runat="server" Text="Cancel" OnClick="BtnCancelBooking_Click" CssClass="btn btn-default" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    <div class="container-fluid">
        <div class="col-md-9">
            <div class="panel-heading">
                <h1><small>CRUD for Available Classrooms</small></h1>
            </div>
            <div class="panel-body">
                <asp:GridView ID="GVRooms" runat="server" PageSize="10" OnPageIndexChanging="GVRooms_PageIndexChanging" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RoomID" OnRowCommand="GVRooms_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="RoomId" DataField="RoomID" />
                    <asp:BoundField HeaderText="Room Name" DataField="RoomName" />
                    <asp:BoundField HeaderText="Number Of Seats" DataField="NumberOfChairs" />
                    <asp:BoundField HeaderText="Floor" DataField="FloorNumber" />
                    <asp:ButtonField ButtonType="Button" CommandName="Del" Text="Delete" ControlStyle-CssClass="btn btn-default" />
                    <asp:ButtonField ButtonType="Button" CommandName="Upd" Text="Update" ControlStyle-CssClass="btn btn-default" />
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
            <asp:Button ID="BtnInsertRoom" runat="server" Text="Add Room" OnClick="BtnInsertRoom_Click" CssClass="btn btn-default" />
            </div>
        </div>

        <div class="col-md-3">
            <asp:Panel ID="PanRoom" runat="server" Visible="false">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtRoomID" Visible="false" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                   <%-- <tr>
                        <td>RoomID:</td>
                        <td><asp:TextBox ID="txtRoomID" runat="server"></asp:TextBox></td>
                    </tr>--%>
                    <tr>
                        <td>
                            <h5>Room Name</h5>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRoomName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valrfRoomName" runat="server" ErrorMessage="Room Name Required" EnableClientScript="False" ControlToValidate="txtRoomName" Text="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h5>Capacity</h5>
                            <asp:DropDownList ID="DDLCap" runat="server">
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>40+</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <asp:Panel ID="PanFloor" runat="server" Visible="false">
                        <tr>
                            <td>
                                <h5>Floor</h5>
                            </td>
                            <td>
                                <asp:DropDownList ID="DDLFloor" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td>
                            <asp:Button ID="btnadd" Visible="false" runat="server" Text="Add Room" OnClick="btnadd_Click1" />
                            <asp:Button ID="btnupdate" Visible="false" OnClick="BtnUpdateRoom_Click" runat="server" Text="Update" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="BtnCancelRoom" runat="server" Text="Cancel" OnClick="BtnCancelRoom_Click" />
                        </td>
                    </tr>
                </table>

            </asp:Panel>
        </div>
    </div>
</asp:Content>
