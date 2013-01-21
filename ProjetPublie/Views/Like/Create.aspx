<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.likesdbs>" %>

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
        <legend>likesdbs</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.messageApproved, "messagesdbs") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("messageApproved", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.messageApproved) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.liker, "utilisateursdbs") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("liker", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.liker) %>
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
