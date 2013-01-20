<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.Models.ThemeIndexModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>ThemeId</th>
            <th>ThemeName</th>
            <th>NbUser</th>
            <th></th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <% if (item.isInTheme == 0)
               { %>
            <td><%: Html.ActionLink("S'abonner", "AddUser", new { id = item.theme.themeId })%></td>
            <% }
               else
               {  %>
            <td><%: Html.ActionLink("Se désabonner", "DelUser", new { id = item.isInTheme })%></td>
            <% } %>

            <td><%: item.theme.themeId %></td>
            <td><%: item.theme.name %></td>
            <td><%: item.nbUser%></td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.theme.themeId }) %> |
               
                <%: Html.ActionLink("Delete", "Delete", new { id=item.theme.themeId })%>
            </td>
            <% if (item.isInTheme == 0)
               { %>
            <td></td>
            <% }
               else
               {  %>
            <td><%: Html.ActionLink("Poster une News dans ce theme", "CreateThemedNew", "Messages", new { themeId = item.theme.themeId }, new { @class = "btn" })%></td>
            <td><%: Html.ActionLink("Voir les nouvelles", "MessagesInTheme", "Messages", new { themeId = item.theme.themeId }, new { @class = "btn" })%></td>
            <% } %>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

