<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Web301.Confirmation" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<script src="Scripts/WebForms/myjs.js"></script>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <br />
            <asp:Label ID="lblConfirm" runat="server"></asp:Label>
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-12">
            <br />          
           
           <p>Tweet your order here!</p>
                    
            <asp:FileUpload runat="server" ID="FileUpload1" runat="server" />
            <br />
            <p>Twitter message:<br />
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Columns="50" /></p>                 
            <asp:Button ID="btnUpload2" runat="server" Text="Tweet your Order!" 
                    CssClass="btn btn-info" OnClick="btnUpload2_Click" />
            </br>
            <asp:Label ID="lblResult" runat="server" EnableViewState="true" />
            <br /><br />  
             <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" 
                    CssClass="btn btn-success" OnClick="btnContinue_Click" />
        </div>
    </div>

</div>
</asp:Content>
