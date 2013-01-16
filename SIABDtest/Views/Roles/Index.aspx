<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.RolesIndexModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <caption>Listes des roles</caption>
        <tr>
            <th>
                RoleId
            </th>
            <th>
                RoleName
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
                <%: Html.ActionLink("Delete", "Delete", new { id = item.id }) %>
            </td>
        </tr>
        <% } %>
    </table>

    <p>
        <%: Html.ActionLink("Create New Role", "Create") %>
    </p>

    <table>
        <caption>Utilisateurs avec Roles</caption>
        <tr>
            
            <th>
                UserId
            </th>
            <th>
                UserName
            </th>
            <th>
                RoleId
            </th>
            <th>
                RoleName
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
                <%: Html.ActionLink("Delete", "DeleteUser", item2)%>
            </td>
        </tr>
    
    <% } %>

    </table>
    <p>
        <%: Html.ActionLink("Donner un rôle à un utilisateur", "AddUser") %>
    </p>


</asp:Content>

