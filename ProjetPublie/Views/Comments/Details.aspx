<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.commentsdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>commentsdbs</legend>

    <div class="display-label">messagesdbs</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.messagesdbs.content) %>
    </div>

    <div class="display-label">utilisateursdbs</div>
    <div class="display-field">
        <%: //Html.DisplayFor(model => model.utilisateursdbs.firstname) %>
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
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
