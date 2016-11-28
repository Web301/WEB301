<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Web301.Admin.Customers" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>HELLO WORLD!</h1>

    <ul>
        <li class="badge" style="font-size:x-large"><a runat="server" href="~/Admin/Admin">Back To Admin</a></li>
    </ul>
    <br />
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="ddlCustomers" CssClass="col-md-3 control-label" Font-Size="Larger">Select a Customer</asp:Label>
            <div class="col-sm-3">                
            <asp:DropDownList ID="ddlCustomers" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCustomers" DataTextField="LastName" DataValueField="Email"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
            </div>
    </div>
    <%--<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceForm"></asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceForm" runat="server"></asp:SqlDataSource>--%>
</asp:Content>
