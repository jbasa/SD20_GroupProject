<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="RoomBookingSystem.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CarouselStyle.css" rel="stylesheet" />

    <script>
        function GetQueryStringParam(queryStringName) {
            // ***this goes on the global scope
            // get querystring as an array split on "&"
            var querystring = location.search.replace('?', '').split('&');
            // declare object
            var queryObj = {};
            // loop through each name-value pair and populate object
            for (var i = 0; i < querystring.length; i++) {
                // get name and value
                var name = querystring[i].split('=')[0];
                var value = querystring[i].split('=')[1];
                // populate object
                queryObj[name] = value;
            }
            return queryObj[queryStringName];
        }

        function CloseModal() {
            $('#confirm').modal('hide');
        }

        function SuccessModal() {
            $('#confirm').modal('hide');
            $('#success').modal('show');
        }

        function CloseSuccessModal() {
            $('#success').modal('hide');
        }
    </script>

    <div class="container-fluid">
        <div class="container-fluid">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="imgs/business1.768x0.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3></h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="imgs/rcbuilding.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3></h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="imgs/carousel3.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3></h3>
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
            <!-- Carousel -->
        </div>

        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Book Your Room!</h2>
                </div>
                <div class="panel-body">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
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
                    <asp:RequiredFieldValidator ID="valrfDate" runat="server" ErrorMessage="Date Required" ControlToValidate="txtDate" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                    <h5>Start Time</h5>
                    <asp:TextBox ID="txtStartTime" runat="server" type="time"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valrfStartTime" runat="server" ErrorMessage="Start Time Required" ControlToValidate="txtStartTime" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                    <h5>End Time</h5>
                    <asp:TextBox ID="txtEndTime" runat="server" type="time"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valrfEndTime" runat="server" ErrorMessage="End Time Required" ControlToValidate="txtEndTime" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Available Rooms</h2>
                </div>
                <div class="panel-body text-center">
                    <asp:GridView ID="gvAvailableRooms" AutoGenerateColumns="False" runat="server" OnRowCommand="gvAvailableRooms_RowCommand" DataKeyNames="RoomID" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="text-center">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="FloorNumber" HeaderText="Floor #" />
                            <asp:BoundField DataField="RoomName" HeaderText="Room Name" />
                            <asp:BoundField DataField="NumberOfChairs" HeaderText="Capacity" />
                            <asp:ButtonField ButtonType="Button" Text="Book" CommandName="book" />
                        </Columns>
                        <FooterStyle BackColor="#b81e0d" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle BackColor="#b81e0d" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>


    <asp:Panel ID="pnlBookingConfirm" runat="server" Visible="false">
        <div class="modal fade" id="confirm" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Room Booking Confirmation</h3>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                <td style="width: 300px;">User</td>
                                <td>
                                    <asp:Label ID="lblUser" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Room</td>
                                <td>
                                    <asp:Label ID="lblRoom" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Start Time</td>
                                <td>
                                    <asp:Label ID="lblStartTime" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>End Time</td>
                                <td>
                                    <asp:Label ID="lblEndTime" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <%-- <input id="btnContinue" onclick="SuccessModal();" runat="server" value="Continue" class="btn btn-success" />--%>
                        <asp:Button ID="btnContinue" runat="server" Text="Continue" OnClick="btnContinue_Click" CssClass="btn btn-success" />
                        <input id="btnCancel" runat="server" class="btn btn-default" value="Cancel" onclick="CloseModal();" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <div class="modal fade" id="success" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3>Booking Confirmed</h3>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">Success! You have succesfully reserved a classroom!</div>
                </div>
                <div class="modal-footer">
                    <input id="btnClose" runat="server" class="btn btn-default" value="Close" onclick="CloseSuccessModal();" />
                </div>
            </div>
        </div>
    </div>

    <script>
        if (GetQueryStringParam("MustLogIn")) {
            $('#login').modal('show');
        }
        if ($("#confirm")) {
            $('#confirm').modal('show');
        }
        if ($("#success")) {
            $('#success').modal('hide');
        }
    </script>
</asp:Content>

