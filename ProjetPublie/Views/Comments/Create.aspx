<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.commentsdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>commentsdbs</legend>

        <div class="editor-label">
            <%:// Html.LabelFor(model => model.messageId, "messagesdbs") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("messageId", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.messageId) %>
        </div>

        <div class="editor-label">
            <%:// Html.LabelFor(model => model.author, "utilisateursdbs") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("author", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.author) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.content) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.content) %>
            <%: Html.ValidationMessageFor(model => model.content) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.date) %>
            <%: Html.ValidationMessageFor(model => model.date) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
