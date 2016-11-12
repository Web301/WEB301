<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Web301.Confirmation" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1>Confirmation</h1>
    <div class="row">
        <div class="col-xs-12">
            <asp:Label ID="lblConfirm" runat="server"></asp:Label>
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-12">
            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" 
                    CssClass="btn" OnClick="btnContinue_Click" />
        </div>
    </div>
</asp:Content>
