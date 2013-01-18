<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.messagesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>messagesdbs</legend>

    <div class="display-label">messageID</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.messageID) %>
    </div>

    <div class="display-label">date</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.date) %>
    </div>

    <div class="display-label">utilisateursdbs</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.utilisateursdbs.firstname) %>
    </div>

    <div class="display-label">content</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.content) %>
    </div>

    <div class="display-label">themesdbs</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.themesdbs.name) %>
    </div>

    <div class="display-label">censored</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.censored) %>
    </div>

    <div class="display-label">important</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.important) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
