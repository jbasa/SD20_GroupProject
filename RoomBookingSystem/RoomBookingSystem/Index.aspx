<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RoomBookingSystem.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/custom.css" rel="stylesheet" />
    <div class="container-fluid">
        <div class="text-center jumbotron jumbotron-index" style="border: 1px #000">
            <h1 style="color: #FFFFFF">Robertson College</h1>
            <p style="color: #FFFFFF">Robertson College will have you career ready in 12 months or less!  Our diploma programs in Business, IT or Health Care are delivered in condensed formats and taught by experienced instructors so you can be in the workforce sooner. Our Career Services team is there to help you land your first job in your new career!</p>
            <a href="AboutUs.aspx" class="btn btn-lg btn-success" target="_blank">Learn More</a>
        </div>


        <div class="page-header text-center">
            <h1>Programs</h1>
        </div>



        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Technology</h2>
                </div>
                <div class="panel-body">
                    Secure your future in the fast growing sector of Information Technology!  Robertson College's IT programs are designed to meet the needs of our students, employers and the IT sector.  If you have a passion for technology, an exciting career in IT may be for you.

If you have any questions about our IT programs, entrance requirements and the enrollment process here at Robertson, please contact us. We look forward to helping you achieve your career and education goals.
                </div>
            </div>
        </div>
        <div class="col-md-4">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Health Care</h2>
                </div>
                <div class="panel-body">
                    Robertson College's health care diploma and certificate programs are designed to meet the needs of our students, employers and the health care industry.  If you enjoy helping and caring for others, a fulfilling career in health care may be for you.  

If you have any questions about our health care programs, entrance requirements and the enrollment process, please contact us. We look forward to helping you achieve your career and education goals.
                </div>
            </div>
        </div>
        <div class="col-md-4">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Business</h2>
                </div>
                <div class="panel-body">
                    Have you ever thought of pursuing a career in business and administration? Robertson College offers many diploma and certificate programs that can get you on the right track to a better future.  Our programs are designed to help our students achieve the training and education they need and be career ready within a year.  

If you have any questions about our business programs or need help deciding which path is for you, please contact us. We look forward to helping you achieve your education and career goals.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
