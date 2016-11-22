<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut1.aspx.cs" Inherits="Web301.CheckOut1" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
       

            <div class="form-group">
                <label class="control-label col-sm-2">First Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Last Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Email</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter a Valid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Address</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">City</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">County</label>
                <div class="col-sm-5">
                    <%--<asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>--%>
                    <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="SqlDataSource1" DataTextField="CountyName" DataValueField="CountyCode" CssClass="form-control" Width="98%"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Counties] ORDER BY [CountyName]"></asp:SqlDataSource>
                </div>
                <div class="col-sm-5">
                    <%--<asp:RequiredFieldValidator ID="rfvState" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtState"></asp:RequiredFieldValidator>--%>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Post Code</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Phone</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                        ErrorMessage="Required" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                </div>
            </div>
      




        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnCheckOut" runat="server" Text="Continue Checkout"
                CssClass="btn" OnClick="btnCheckOut_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel Order"
                CausesValidation="False" CssClass="btn" OnClick="btnCancel_Click" />
            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping"
                CausesValidation="False" CssClass="btn" OnClick="btnContinue_Click" />
        </div>
    </div>
</asp:Content>
