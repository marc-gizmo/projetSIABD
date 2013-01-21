<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.commentsdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>commentsdbs</legend>

    <div class="display-label">messagesdbs</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.messagesdbs.content) %>
    </div>

    <div class="display-label">utilisateursdbs</div>
    <div class="display-field">
        <%: //Html.DisplayFor(model => model.my_aspnet_users.name) %>
    </div>

    <div class="display-label">content</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.content) %>
    </div>

    <div class="display-label">date</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.date) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
