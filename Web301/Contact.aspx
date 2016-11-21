<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Web301.Contact" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
   <%-- <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>--%>
    <address>
         Rich Mans Lane<br />
        Upper Rosses Point<br />
        Sligo<br />
        <abbr title="Phone">P:</abbr>
        07191-12345
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:t-printsRus@gmail.com">t-printsRus@gmail.com</a><br />
    </address>
    <div>
        <h3>Returns</h3>
        On all pre printed tshirts we accept returns within 7 days of recipt. 
        Unfortunately for custimised t-shirts we do not accept returns.
    </div>
    <div>
        <h3>Deliveries</h3>
        
    </div>
</div>
</asp:Content>
