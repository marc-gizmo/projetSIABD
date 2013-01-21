<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.commentsdbs>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            messagesdbs
        </th>
        <th>
            utilisateursdbs
        </th>
        <th>
            content
        </th>
        <th>
            date
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.messagesdbs.content) %>
        </td>
        <td>
            <%: //Html.DisplayFor(modelItem => item.utilisateursdbs.firstname) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.content) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.date) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.ID }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.ID }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
