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
    <div class="container">
        <div id="owl-example" class="owl-carousel owl-theme">
            <div class="item">
                <asp:Image ID="Image1" CssClass="lazyOwl" runat="server" src="Images/Products/t1.jpg" />
            </div>
            <div class="item">
                <asp:Image ID="Image10" CssClass="lazyOwl" runat="server" src="Images/Products/t10.jpg" />
            </div>
            <div class="item">
                <asp:Image ID="Image5" CssClass="lazyOwl" runat="server" src="Images/Products/t5.jpg" />
            </div>
            <div class="item">
                <asp:Image ID="Image6" CssClass="lazyOwl" runat="server" src="Images/Products/t6.jpg" />
            </div>
            <div class="item">
                <asp:Image ID="Image7" CssClass="lazyOwl" runat="server" src="Images/Products/t7.jpg" />
            </div>
            <%-- <div class="item">
            <asp:Image ID="Image8" CssClass="lazyOwl" runat="server" src="Images/Products/t8.jpg"/>
        </div>--%>
            <div class="item">
                <asp:Image ID="Image2" CssClass="lazyOwl" runat="server" src="Images/Products/t9.jpg" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="col-xs-4">
                    <iframe src="https://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FT-shirts-r-us-personalized-and-Printed-t-shirts-1011529745549476&width=340&colorscheme=light&show_faces=true&border_color&stream=true&header=true&height=514"
                        scrolling="yes" style="border: solid 2px black; overflow: hidden; width: 340px; height: 514px; background: white; float: left;" allowtransparency="true"></iframe>
                </div>
                <div class="col-xs-4" style="border: solid 2px black;">
                    <a class="twitter-timeline" href="https://twitter.com/clairesligo">Tweets by clairesligo</a>
                    <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
                <div class="col-xs-4" ">
                    <iframe width="340" height="514" style="border: solid 2px black;" src="http://instagram.com/p/a6wxu4RHm1/embed"></iframe>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspProducts]"></asp:SqlDataSource>
        </div>
    </div>


</asp:Content>
