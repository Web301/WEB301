<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut1.aspx.cs" Inherits="Web301.CheckOut1" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        

        <div class="form-group">
            <label class="control-label col-sm-2">First Name:</label>
            <div class="col-sm-5">
                <asp:textbox id="txtFirstName" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="rfvFirstName" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtFirstName"></asp:requiredfieldvalidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">Last Name:</label>
            <div class="col-sm-5">
                <asp:textbox id="txtLastName" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="rfvLastName" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtLastName"></asp:requiredfieldvalidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">Email</label>
            <div class="col-sm-5">
                <asp:textbox id="txtEmail" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="rfvEmail" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtEmail"></asp:requiredfieldvalidator>
                <asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" errormessage="Please Enter a Valid Email" controltovalidate="txtEmail" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">Address</label>
            <div class="col-sm-5">
                <asp:textbox id="txtAddress" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="rfvAddress" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtAddress"></asp:requiredfieldvalidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">City</label>
            <div class="col-sm-5">
                <asp:textbox id="txtCity" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="rfvCity" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtCity"></asp:requiredfieldvalidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">County</label>
            <div class="col-sm-5">
                <%--<asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>--%>
                <asp:dropdownlist id="ddlCounties" runat="server" datasourceid="SqlDataSource1" datatextfield="CountyName" datavaluefield="CountyCode" cssclass="form-control" width="98%"></asp:dropdownlist>
                <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:DefaultConnection %>" selectcommand="SELECT * FROM [Counties] ORDER BY [CountyName]"></asp:sqldatasource>
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
                <asp:textbox id="txtZip" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="rfvZip" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtZip"></asp:requiredfieldvalidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">Phone</label>
            <div class="col-sm-5">
                <asp:textbox id="txtPhone" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="rfvPhone" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtPhone"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Personalised Image</label>
            <div class="col-sm-5">
                <asp:fileupload runat="server" id="FileUpload1"  onclick="FileUpload1_Load" />
            </div>
            <div class="col-sm-5">
                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server"
                    errormessage="Required" cssclass="text-danger"
                    display="Dynamic" controltovalidate="txtPhone"></asp:requiredfieldvalidator>
            </div>
        </div>


        <div class="col-sm-10">
            
            <asp:button id="btnCancel" runat="server" text="Cancel Order"
                causesvalidation="False" cssclass="btn btn-danger" onclick="btnCancel_Click" Width="142px" />
            <asp:button id="btnContinue" runat="server" text="Continue Shopping"
                causesvalidation="False" style="margin-left:2em"  cssclass="btn" onclick="btnContinue_Click" Width="156px" />
            <asp:button id="btnCheckOut" runat="server" text="Continue Checkout"
                cssclass="btn btn-success" style="margin-left:2em"  onclick="btnCheckOut_Click" Width="159px" />
        </div>
        
    </div>
</asp:Content>
