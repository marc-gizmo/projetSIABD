﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.likesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
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
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
