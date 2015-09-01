<%@ Page Title="" Language="C#" MasterPageFile="~/RoomBookingSystem.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RoomBookingSystem.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/custom.css" rel="stylesheet" />
    <div class="container-fluid">        
        <div class="text-center jumbotron jumbotron-index" style="border: 1px #000">
            <h1 style="color:#FFFFFF">Robertson College</h1>
            <p style="color:#FFFFFF">Robertson College will have you career ready in 12 months or less!  Our diploma programs in Business, IT or Health Care are delivered in condensed formats and taught by experienced instructors so you can be in the workforce sooner. Our Career Services team is there to help you land your first job in your new career!</p>
            <a href="AboutUs.aspx" class="btn btn-lg btn-success" target="_blank">Learn More</a>
        </div>
    </div>

    <div class="col-md-4">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="panel-title">Why Robertson College?</h2>
            </div>
            <div class="panel-body">
               Choosing the right career and the right college to trust with your education are important decisions to make on your journey to success.  Whether you are just starting your career, looking for a career change or want to upgrade your skills and broaden your career options, we can get you on the right track to a brighter future.

If you would like to get started, simply fill out the form below to contact the campus you are interested in!
            </div>
        </div>
    </div>
    <div class="col-md-4">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="panel-title">Why do we use it?</h2>
            </div>
            <div class="panel-body">
                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="panel-title">Where does it come from?</h2>
            </div>
            <div class="panel-body">
                Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.
         Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
            </div>
        </div>
    </div>
</asp:Content>
