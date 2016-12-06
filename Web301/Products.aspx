<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Web301.Products" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
    <div class="container">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <img src='/Images/Products/<%# Eval("ImageFile") %>'
                                alt='<%# Eval("ProductName") %>' style="max-height: 300px; min-height:300px" />
                            <div class="caption">
                                <h3><%# Eval("ProductShortDescription") %></h3>
                                <p>
                                    <b>Price: <%# Eval("UnitPrice", "{0:c}") %></b>
                                    <br>
                                    <br>
                                    <%# Eval("ProductLongDescription") %>
                                </p>
                            </div>
                            <a class="btn btn-default" href="Order.aspx">Order Now</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="SELECT [ProductID], [ProductName], [ProductShortDescription], [ProductLongDescription], [ImageFile], [UnitPrice] 
                        FROM [Products]"></asp:SqlDataSource>
  
    <%--<asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
<hr />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
    <Columns>
        <asp:BoundField DataField="Text" />
        <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="100" ControlStyle-Width="100" />
    </Columns>
</asp:GridView>--%>
   
</asp:Content>
