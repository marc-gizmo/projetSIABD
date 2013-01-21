<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.likesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>likesdbs</legend>

    <div class="display-label">messagesdbs</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.messagesdbs.content) %>
    </div>

    <div class="display-label">utilisateursdbs</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.utilisateursdbs.firstname) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
