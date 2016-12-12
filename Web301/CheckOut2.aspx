<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut2.aspx.cs" Inherits="Web301.CheckOut2" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server"> 
    
<div class="container">
    <asp:sqldatasource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Customers] WHERE [Email] = @Email" InsertCommand="INSERT INTO [Customers] ([Email], [FirstName], [LastName], [Address1], [City], [County], [PostCode], [PhoneNumber], [PersonalisedImage]) VALUES (@Email, @FirstName, @LastName, @Address1, @City, @County, @PostCode, @PhoneNumber, @PersonalisedImage)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address1] = @Address1, [City] = @City, [County] = @County, [PostCode] = @PostCode, [PhoneNumber] = @PhoneNumber, [PersonalisedImage] = @PersonalisedImage WHERE [Email] = @Email">
            <DeleteParameters>
                <asp:Parameter Name="Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address1" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="County" Type="String" />
                <asp:Parameter Name="PostCode" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="PersonalisedImage" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address1" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="County" Type="String" />
                <asp:Parameter Name="PostCode" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="PersonalisedImage" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </UpdateParameters>
        </asp:sqldatasource>

    <asp:sqldatasource ID="SqlDataSourceSalesOrders" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [SalesOrders] WHERE [SalesOrderID] = @original_SalesOrderID" InsertCommand="INSERT INTO [SalesOrders] ([CustEmail], [SalesOrderDate], [Subtotal], [ShippingMethod], [Shipping], [Total], [CreditCardType], [CardNumber], [ExpMonth], [ExpYear]) VALUES (@CustEmail, @SalesOrderDate, @Subtotal, @ShippingMethod, @Shipping, @Total, @CreditCardType, @CardNumber, @ExpMonth, @ExpYear)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SalesOrders]" UpdateCommand="UPDATE [SalesOrders] SET [CustEmail] = @CustEmail, [SalesOrderDate] = @SalesOrderDate, [Subtotal] = @Subtotal, [ShippingMethod] = @ShippingMethod, [Shipping] = @Shipping, [Total] = @Total, [CreditCardType] = @CreditCardType, [CardNumber] = @CardNumber, [ExpMonth] = @ExpMonth, [ExpYear] = @ExpYear WHERE [SalesOrderID] = @original_SalesOrderID">
        <DeleteParameters>
            <asp:Parameter Name="original_SalesOrderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustEmail" Type="String" />
            <asp:Parameter Name="SalesOrderDate" Type="DateTime" />
            <asp:Parameter Name="Subtotal" Type="Decimal" />
            <asp:Parameter Name="ShippingMethod" Type="String" />
            <asp:Parameter Name="Shipping" Type="Decimal" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="CreditCardType" Type="String" />
            <asp:Parameter Name="CardNumber" Type="String" />
            <asp:Parameter Name="ExpMonth" Type="Int16" />
            <asp:Parameter Name="ExpYear" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustEmail" Type="String" />
            <asp:Parameter Name="SalesOrderDate" Type="DateTime" />
            <asp:Parameter Name="Subtotal" Type="Decimal" />
            <asp:Parameter Name="ShippingMethod" Type="String" />
            <asp:Parameter Name="Shipping" Type="Decimal" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="CreditCardType" Type="String" />
            <asp:Parameter Name="CardNumber" Type="String" />
            <asp:Parameter Name="ExpMonth" Type="Int16" />
            <asp:Parameter Name="ExpYear" Type="Int16" />
            <asp:Parameter Name="original_SalesOrderID" Type="Int32" />
        </UpdateParameters>
    </asp:sqldatasource>

    <asp:sqldatasource ID="SqlDataSourceOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [SalesOrderID] = @SalesOrderID AND [ProductID] = @ProductID" InsertCommand="INSERT INTO [OrderDetails] ([SalesOrderID], [ProductID], [UnitPrice], [OrderQuantity], [Extension]) VALUES (@SalesOrderID, @ProductID, @UnitPrice, @OrderQuantity, @Extension)" SelectCommand="SELECT * FROM [OrderDetails]" UpdateCommand="UPDATE [OrderDetails] SET [UnitPrice] = @UnitPrice, [OrderQuantity] = @OrderQuantity, [Extension] = @Extension WHERE [SalesOrderID] = @SalesOrderID AND [ProductID] = @ProductID">
        <DeleteParameters>
            <asp:Parameter Name="SalesOrderID" Type="Int32" />
            <asp:Parameter Name="ProductID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SalesOrderID" Type="Int32" />
            <asp:Parameter Name="ProductID" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="OrderQuantity" Type="Int32" />
            <asp:Parameter Name="Extension" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="OrderQuantity" Type="Int32" />
            <asp:Parameter Name="Extension" Type="Decimal" />
            <asp:Parameter Name="SalesOrderID" Type="Int32" />
            <asp:Parameter Name="ProductID" Type="String" />
        </UpdateParameters>
    </asp:sqldatasource>

    <div class="form-group">
            <div class="col-sm-6">
                <asp:Label ID="lblSubTotal" runat="server" EnableViewState="False"
                    CssClass=" col-sm-12 label-success" Font-Size="X-Large" ></asp:Label>               
            </div>
    </div>
    <div class="form-group">
            <div class="col-sm-6">
                <asp:Label ID="lblShipping" runat="server" EnableViewState="False"
                    CssClass=" col-sm-12 label-success" Font-Size="X-Large" ></asp:Label>               
            </div>
    </div>
    <div class="form-group">
            <div class="col-sm-6">
                <asp:Label ID="lblOrderTotal" runat="server" EnableViewState="False"
                    CssClass=" col-sm-12 label-info" Font-Size="X-Large" ></asp:Label>               
            </div>
    </div>
    
    <%--<h3>Shipping Method</h3>
    <div class="form-group">
        <label class="control-label col-sm-2">Choose one:</label>
        <div class="col-sm-10">
            <asp:RadioButtonList ID="rblShipping" runat="server">
                <asp:ListItem Selected="True">An Post First Class</asp:ListItem>
                <asp:ListItem>Two Day Courier</asp:ListItem>
                <asp:ListItem>Overnight Express </asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>--%>

    <h3>Payment Information</h3>
    <div class="form-group">
        <label class="control-label col-sm-2">Card Type:</label>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddlCardType" runat="server" CssClass="form-control">
                <asp:ListItem Selected="True" Value="None">--Select a credit card--</asp:ListItem>
                <asp:ListItem>VISA</asp:ListItem>
                <asp:ListItem Value="MC">MasterCard</asp:ListItem>
                <asp:ListItem Value="AMEX">American Express</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ControlToValidate="ddlCardType"
                Display="Dynamic" ErrorMessage="Required" InitialValue="None" 
                CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Card number</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:regularexpressionvalidator runat="server" CssClass="text-danger" errormessage="Enter a Valid Card Number" ValidationExpression="\d{16}$" ControlToValidate="txtCardNumber"></asp:regularexpressionvalidator>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtCardNumber"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Expiration date:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtExpiration" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:regularexpressionvalidator runat="server" CssClass="text-danger" errormessage="Enter a Valid Date (eg 10/17)" ControlToValidate="txtExpiration" ValidationExpression="^((0[1-9])|(1[0-2]))\/((17)|([1][7-9])|([2][0-9]))$"></asp:regularexpressionvalidator>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvExpiration" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtExpiration"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAccept" runat="server" Text="Accept Order" 
                CssClass="btn btn-success" OnClick="btnAccept_Click" Width="155px" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                CausesValidation="False" CssClass="btn btn-danger" style="margin-left:2em" OnClick="btnCancel_Click" Width="155px" />
            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" 
                CausesValidation="False" CssClass="btn" style="margin-left:2em" OnClick="btnContinue_Click" Width="157px" />
        </div>
    </div>
    <asp:Label ID="lblError" runat="server" ></asp:Label>
</div>
</asp:Content>
