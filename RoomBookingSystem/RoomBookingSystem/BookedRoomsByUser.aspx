<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="BookedRoomsByUser.aspx.cs" Inherits="RoomBookingSystem.BookedRoomsByUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="col-md-12">
            <div class="page-header">
                <h1>Your Booked Rooms</h1>
            </div>
            <div class="panel-body">
                <asp:GridView ID="gvUserBookedRooms" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

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
            </div>
        </div>

    </div>
</asp:Content>
