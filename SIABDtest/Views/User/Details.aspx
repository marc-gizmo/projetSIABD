<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.my_aspnet_membership>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">userId</div>
        <div class="display-field"><%: Model.userId %></div>
        
        <div class="display-label">Email</div>
        <div class="display-field"><%: Model.Email %></div>
        
        <div class="display-label">Comment</div>
        <div class="display-field"><%: Model.Comment %></div>
        
        
        
        <div class="display-label">IsApproved</div>
        <div class="display-field"><%: Model.IsApproved %></div>
        
        
        <div class="display-label">IsLockedOut</div>
        <div class="display-field"><%: Model.IsLockedOut %></div>
        
       
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.userId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

