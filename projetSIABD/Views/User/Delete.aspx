<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.my_aspnet_membership>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
       
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">userId</div>
        <div class="display-field"><%: Model.userId %></div>
       
        <div class="display-label">Email</div>
        <div class="display-field"><%: Model.Email %></div>
      
             
        
        
    </fieldset>
     <% using (Html.BeginForm())
       { %>
       <%: Html.ValidationSummary(true) %>
        <p>
           <%: Html.Hidden("email",Model.Email) %>
		    <input type="submit" value="Delete2" /> |
		    <%: Html.ActionLink("Back to List", "Index")%>
        </p>
    <% } %>

</asp:Content>

