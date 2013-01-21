<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.messagesdbs>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Publier une nouvelle</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            messageID
        </th>
        <th>
            date
        </th>
        <th>
            utilisateursdbs
        </th>
        <th>
            content
        </th>
        <th>
            themesdbs
        </th>
        <th>
            censored
        </th>
        <th>
            important
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.messageID) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.utilisateursdbs.firstname) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.content) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.themesdbs.name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.censored) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.important) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new {  id=item.messageID  }) %> |
            <%: Html.ActionLink("Details", "Details", new {  id=item.messageID  }) %> |
            <%: Html.ActionLink("Delete", "Delete", new {  id=item.messageID  }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
