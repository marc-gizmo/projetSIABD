<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.Models.ThemeIndexModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index des thèmes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index des thèmes</h2>

    <table>
        <tr>
            <th></th>
            <th>Identifiant</th>
            <th>Nom du thème</th>
            <th>Nombre d'abonnés</th>
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
            <% if (Page.User.IsInRole("Administrateur"))
               { %>

                <%: Html.ActionLink("Editer", "Edit", new { id = item.theme.themeId })%> |
               
                <%: Html.ActionLink("Supprimer", "Delete", new { id = item.theme.themeId })%>
            
            <% }
               %>
               <% if (item.isInTheme != 0)           
               {
                   if (Page.User.IsInRole("Administrateur"))
                   { %>
               | 
               <% } %>
                <%: Html.ActionLink("Poster un message dans ce theme", "CreateThemedNew", "Messages", new { themeId = item.theme.themeId }, new { @class = "btn" })%>
                <%: Html.ActionLink("Voir les messages", "MessagesInTheme", "Messages", new { themeId = item.theme.themeId }, new { @class = "btn" })%>

            <% } %>
            
            
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Créer un nouveau thème", "Create") %>
    </p>

</asp:Content>

