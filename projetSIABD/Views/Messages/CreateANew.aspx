<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.messagesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateANew
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Publier une nouvelle</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>publier une nouvelle</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.content) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.content) %>
            <%: Html.ValidationMessageFor(model => model.content) %>
        </div>

        <p>
            <input type="submit" value="Publier" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "NewsFeed") %>
</div>

</asp:Content>
