<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.Models.UserModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index des utilisateurs
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index des utilisateurs</h2>

    <table>
        <tr>
           
            <th>
                Identifiant
            </th>
            <th>
                Nom
            </th>
            <th>
                Email
            </th>
            <th>
                Commentaire
            </th>
            
            <th>
                Autorisé
            </th>
            
            
             <th></th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
          
            <td>
                <%: item.membership.userId %>
            </td>
            <td>
                <%: item.UserName %>
            </td>
            <td>
                <%: item.membership.Email %>
            </td>
            <td>
                <%: item.membership.Comment %>
            </td>
            
            <td>
                <%: item.membership.IsApproved %>
            </td>
            
             <td>
                <%: Html.ActionLink("Editer", "Edit", new { id=item.membership.userId }) %> |
                <%: Html.ActionLink("Détails", "Details", new { id=item.membership.userId })%> |
                <%: Html.ActionLink("Supprimer", "Delete", new { id=item.membership.userId })%>
            </td>
           
        </tr>
    
    <% } %>

    </table>
    <br />
    <p>
        <%: Html.ActionLink("Créer un nouvel utilisateur", "Create") %>
    </p>

</asp:Content>

