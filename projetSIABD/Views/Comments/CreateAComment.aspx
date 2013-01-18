<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.commentsdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm())
   { %>
    <%: Html.ValidationSummary(true)%>
    <fieldset>
        <legend>commentsdbs</legend>

        <%: Html.HiddenFor(model => model.messageId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.content)%>
            <%: Model.messageId = Model.messageId  %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.content)%>
            <%: Html.ValidationMessageFor(model => model.content)%>
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
