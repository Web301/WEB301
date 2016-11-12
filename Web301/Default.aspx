<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web301._Default" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {

            $("#owl-example").owlCarousel({
                autoPlay: 3000, //Set AutoPlay to 3 seconds
                items: 3,
                lazyLoad: true,
                navigation: true
            });

        });
    </script>
    <div id="owl-example" class="owl-carousel owl-theme">
        <div class="item">
            <asp:Image ID="Image1" CssClass="lazyOwl" runat="server" src="Images/Products/t1.jpg"/>
        </div>
        <div class="item">
            <asp:Image ID="Image10" CssClass="lazyOwl" runat="server" src="Images/Products/t10.jpg"/>
        </div>
        <div class="item">
            <asp:Image ID="Image5" CssClass="lazyOwl" runat="server" src="Images/Products/t5.jpg"/>
        </div>
        <div class="item">
            <asp:Image ID="Image6" CssClass="lazyOwl" runat="server" src="Images/Products/t6.jpg"/>
        </div>
        <div class="item">
            <asp:Image ID="Image7" CssClass="lazyOwl" runat="server" src="Images/Products/t7.jpg"/>
        </div>
       <%-- <div class="item">
            <asp:Image ID="Image8" CssClass="lazyOwl" runat="server" src="Images/Products/t8.jpg"/>
        </div>--%>
        <div class="item">
            <asp:Image ID="Image2" CssClass="lazyOwl" runat="server" src="Images/Products/t9.jpg"/>
        </div>

    </div>





    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspProducts]"></asp:SqlDataSource>



</asp:Content>
