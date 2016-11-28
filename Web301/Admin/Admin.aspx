<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Web301.Admin.Admin" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceholder" runat="server">
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>HELLO WORLD!</h1>
<h2>ADMIN STUFF GOES HERE</h2>
<div class="container">
    <div class="col-sm-6"><%-- cart display column --%>
            <%--<div class="form-group">
                <div class="col-sm-12"><asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ProductName" DataValueField="ProductID"></asp:DropDownList></div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
            </div>--%>
            <div class="form-horizontal">
                <div class="col-sm-12">
                    <ul>
                        <li class="badge" style="font-size:x-large"><a runat="server" href="~/Admin/Products">Products</a></li>
                    </ul><br/>
                    <ul>
                        <li class="badge" style="font-size:x-large"><a runat="server" href="~/Admin/Customers">Customers</a></li>
                    </ul><br/>
                    <ul>
                        <li class="badge" style="font-size:x-large"><a runat="server" href="#">Spare</a></li>
                    </ul>
                    <%--<asp:GridView ID="GridView1" CssClass="table table-bordered table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceProducts" DataKeyNames="ProductID">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:BoundField DataField="ProductShortDescription" HeaderText="ProductShortDescription" SortExpression="ProductShortDescription" />
                        <asp:BoundField DataField="ProductLongDescription" HeaderText="ProductLongDescription" SortExpression="ProductLongDescription" />
                        <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                        <asp:BoundField DataField="QuantityInStock" HeaderText="QuantityInStock" SortExpression="QuantityInStock" />
                    </Columns>
                    </asp:GridView>--%>

                </div>
                <%--<asp:SqlDataSource ID="SqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductID]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID AND [ProductName] = @original_ProductName AND [ProductShortDescription] = @original_ProductShortDescription AND [ProductLongDescription] = @original_ProductLongDescription AND (([ImageFile] = @original_ImageFile) OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL)) AND [UnitPrice] = @original_UnitPrice AND [QuantityInStock] = @original_QuantityInStock" InsertCommand="INSERT INTO [Products] ([ProductID], [ProductName], [ProductShortDescription], [ProductLongDescription], [ImageFile], [UnitPrice], [QuantityInStock]) VALUES (@ProductID, @ProductName, @ProductShortDescription, @ProductLongDescription, @ImageFile, @UnitPrice, @QuantityInStock)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [ProductShortDescription] = @ProductShortDescription, [ProductLongDescription] = @ProductLongDescription, [ImageFile] = @ImageFile, [UnitPrice] = @UnitPrice, [QuantityInStock] = @QuantityInStock WHERE [ProductID] = @original_ProductID AND [ProductName] = @original_ProductName AND [ProductShortDescription] = @original_ProductShortDescription AND [ProductLongDescription] = @original_ProductLongDescription AND (([ImageFile] = @original_ImageFile) OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL)) AND [UnitPrice] = @original_UnitPrice AND [QuantityInStock] = @original_QuantityInStock">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ProductID" Type="String" />
                        <asp:Parameter Name="original_ProductName" Type="String" />
                        <asp:Parameter Name="original_ProductShortDescription" Type="String" />
                        <asp:Parameter Name="original_ProductLongDescription" Type="String" />
                        <asp:Parameter Name="original_ImageFile" Type="String" />
                        <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="original_QuantityInStock" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductID" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="ProductShortDescription" Type="String" />
                        <asp:Parameter Name="ProductLongDescription" Type="String" />
                        <asp:Parameter Name="ImageFile" Type="String" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="QuantityInStock" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="ProductShortDescription" Type="String" />
                        <asp:Parameter Name="ProductLongDescription" Type="String" />
                        <asp:Parameter Name="ImageFile" Type="String" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="QuantityInStock" Type="Int32" />
                        <asp:Parameter Name="original_ProductID" Type="String" />
                        <asp:Parameter Name="original_ProductName" Type="String" />
                        <asp:Parameter Name="original_ProductShortDescription" Type="String" />
                        <asp:Parameter Name="original_ProductLongDescription" Type="String" />
                        <asp:Parameter Name="original_ImageFile" Type="String" />
                        <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="original_QuantityInStock" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>--%>
        </div>
    </div>
</div>
</asp:Content>
