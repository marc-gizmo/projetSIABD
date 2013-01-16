<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.messagesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>messagesdbs</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.messageID) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.messageID) %>
            <%: Html.ValidationMessageFor(model => model.messageID) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.date) %>
            <%: Html.ValidationMessageFor(model => model.date) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.author, "utilisateursdbs") %>
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
            <%: Html.LabelFor(model => model.theme, "themesdbs") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("theme", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.theme) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.censored) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.censored) %>
            <%: Html.ValidationMessageFor(model => model.censored) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.important) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.important) %>
            <%: Html.ValidationMessageFor(model => model.important) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
