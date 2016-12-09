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
                <div class="col-xs-12 col-md-4  embed-responsive embed-responsive-16by9">
                    <iframe src="https://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FT-shirts-r-us-personalized-and-Printed-t-shirts-1011529745549476&width=340&colorscheme=light&show_faces=true&border_color&stream=true&header=true&height=642"
                        scrolling="yes" class="embed-responsive-item" style="border: solid 2px black;   width: 340px; height: 642px; background: white;"></iframe>
                </div>
                <div class="col-xs-12 col-md-4  embed-responsive embed-responsive-16by9" style="border: solid 2px black;height: 642px;margin-left:-8px;">
                  <span class="embed-responsive-item">  <a href="https://twitter.com/paull1068" class="twitter-timeline" style="width: 340px; height: 642px;"  scrolling="yes" ></a>
                    <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script></span>
                </div>
                <div class="col-xs-12 col-md-4  embed-responsive embed-responsive-16by9" ">
                    <iframe src="https://instagram.com/p/a6wxu4RHm1/embed"
                         scrolling="yes" class="embed-responsive-item" style="border: solid 2px black; width:340px; height:642px; background: white; margin-left:25px;" ></iframe>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspProducts]"></asp:SqlDataSource>
        </div>
    </div>


</asp:Content>
