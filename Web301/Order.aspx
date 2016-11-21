<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Web301.Order" %>

<%@ MasterType VirtualPath="~/Site.Master" %>



<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row"><%-- row 1 --%>
            <div class="col-sm-8"><%-- product drop down and info column --%>
                <div class="form-group">
                    <label class="col-sm-6">Please select a product:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="ProductName" 
                            DataValueField="ProductID" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                            SelectCommand="SELECT [ProductID], [ProductName], [ProductShortDescription], 
                            [ProductLongDescription], [ImageFile], [UnitPrice] FROM [Products] 
                            ORDER BY [ProductName]">
                        </asp:SqlDataSource>
                    </div>
                </div>   
                <div class="form-group">
                    <div class="col-sm-12"><h4><asp:Label ID="lblName" runat="server"></asp:Label></h4></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12"><asp:Label ID="lblShortDescription" runat="server"></asp:Label></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12"><asp:Label ID="lblLongDescription" runat="server"></asp:Label></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12"><asp:Label ID="lblUnitPrice" runat="server"></asp:Label></div>
                </div>
            </div>
            <div class="col-sm-4" ><%-- product image column --%>
                <asp:Image ID="imgProduct" style="max-height: 250px; max-width: 250px;" runat="server" />
            </div>
        </div><%-- end of row 1 --%>

        <div class="row"><%-- row 2 --%>
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="col-sm-2">Quantity:</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtQuantity" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                            runat="server" ControlToValidate="txtQuantity" Display="Dynamic" 
                            ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" 
                            ControlToValidate="txtQuantity" Display="Dynamic" 
                            ErrorMessage="Quantity must range from 1 to 500."
                            MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </div>
                </div>
            </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" 
                            onclick="btnAdd_Click" CssClass="btn" />
                        <asp:Button ID="btnCart" runat="server" Text="Go to Cart" 
                            PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn" />
                        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" 
                            CausesValidation="False" CssClass="btn" OnClick="btnCheckOut_Click" />
                    </div>
                </div>
                <div>
                     <%--<p>Twitter message:<br /><asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Columns="50" /></p>--%>
                   
                    <asp:Label ID="lblSelImage" runat="server" Text="Label" Visible="false">Select Image
                    <asp:FileUpload runat="server" id="FileUpload1" Visible="false" /></asp:label>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" Visible="false" OnClick="btnUpload_Click" /><hr />
                    <%--<asp:Label ID="lblResult" runat="server" EnableViewState="true" />--%>
                </div>
        </div><%-- end of row 2 --%>
    </div>
</asp:Content>
