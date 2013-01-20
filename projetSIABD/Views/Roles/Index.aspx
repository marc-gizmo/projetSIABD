<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.RolesIndexModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index des rôles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index des rôles</h2>

    <table>
        <caption>Listes des roles</caption>
        <tr>
            <th>
                Identifiant
            </th>
            <th>
                Nom du rôle
            </th>
            <th></th>
        </tr>
        <% foreach (var item in Model.Roles) { %> 
        <tr>
            <td>
                <%: item.id %>
            </td>
            <td>
                <%: item.name %>
            </td>
            <td>
                <%: Html.ActionLink("Supprimer", "Delete", new { id = item.id }) %>
            </td>
        </tr>
        <% } %>
    </table>

    <p>
        <%: Html.ActionLink("Créer un nouveau rôle", "Create") %>
    </p>

    <table>
        <caption>Utilisateurs avec Roles</caption>
        <tr>
            
            <th>
                Utilisateur
            </th>
            <th>
                Nom d'utilisateur
            </th>
            <th>
                Rôle
            </th>
            <th>
                Nom du rôle
            </th>
            <th></th>
        </tr>

    <% foreach (var item2 in Model.UserWithRoles) { %>
    
        <tr>
            
            <td>
                <%: item2.UserId %>
            </td>
            <td>
                <%: item2.UserName %>
            </td>
            <td>
                <%: item2.RoleId %>
            </td>
            <td>
                <%: item2.RoleName %>
            </td>
            <td>
                <%: Html.ActionLink("Supprimer la ligne", "DeleteUser", item2)%>
            </td>
        </tr>
    
    <% } %>

    </table>
    <p>
        <%: Html.ActionLink("Donner un rôle à un utilisateur", "AddUser") %>
    </p>


</asp:Content>

