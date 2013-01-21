<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.commentsdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Commenter
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Commenter la nouvelle</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm())
   { %>
    <%: Html.ValidationSummary(true)%>
    <fieldset>
        <legend>Commentaire</legend>

        <%: Html.HiddenFor(model => model.messageId) %>

        <div class="editor-label">
            écrivez ici le contenu de votre commentaire
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.content)%>
            <%: Html.ValidationMessageFor(model => model.content)%>
        </div>

        <p>
            <input type="submit" value="Commenter" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "NewsFeed", "Messages", null, new { @class = "btn"})%>
</div>

</asp:Content>
