﻿<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Web301.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your Product page.</h3>
  
    <asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
<hr />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
    <Columns>
        <asp:BoundField DataField="Text" />
        <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="100" ControlStyle-Width="100" />
    </Columns>
</asp:GridView>
   
</asp:Content>
