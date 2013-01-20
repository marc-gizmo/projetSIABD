<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.RolesWithUserModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Enlever un rôle à un utilisateur
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Enlever un rôle à un utilisateur</h2>

    <h3>Etes-vous sûr de vouloir le rôle à cet utilisateur ?</h3>
    <fieldset>
        
        <table>
            <tr>
                <th>Utilisateur</th>
                <th>Nom d'utilisateur</th>
                <th>Rôle</th>
                <th>Nom du rôle</th>
            </tr>
            <tr>
                <td><%: Model.UserId %></td>
                <td><%: Model.UserName %></td>
                <td><%: Model.RoleId %></td>
                <td><%: Model.RoleName %></td>
            </tr>
        </table>
        
        
    </fieldset>
    <% using (Html.BeginForm("DeleteUser2","Roles")) { %>
        <p>
            <%: Html.HiddenFor(model => Model.UserId) %>
            <%: Html.HiddenFor(model => Model.UserName) %>
            <%: Html.HiddenFor(model => Model.RoleId) %>
            <%: Html.HiddenFor(model => Model.RoleName) %>
		    <input type="submit" value="Supprimer" /> |
		    <%: Html.ActionLink("Index des rôles", "Index") %>
        </p>
    <% } %>

</asp:Content>

