<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web301._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="media">
            <div class="media-left">
                <asp:Image ID="Image5" Class="media-object" runat="server" src="Images/Logo_TV_2015.png" Width="150" Height="100" />
            </div>
            <div class="media-body">
                <h1 class="media-heading">Our Awesome shop</h1>
            </div>
    </div>
    <br />
    <br />
    <asp:Image ID="Image1" runat="server" src="Images/tshirt.jpeg" Width="250" Height="200" />
    <asp:Image ID="Image2" runat="server" src="Images/tshirt.jpeg" Width="250" Height="200" />
    <asp:Image ID="Image3" runat="server" src="Images/tshirt.jpeg" Width="250" Height="200" />
    <asp:Image ID="Image4" runat="server" src="Images/tshirt.jpeg" Width="250" Height="200" />



</asp:Content>
