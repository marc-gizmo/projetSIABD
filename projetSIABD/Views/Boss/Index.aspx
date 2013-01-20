<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.Models.BossModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Statistiques du site
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Statistiques du site</h2>

    <table>
        <tr>
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
            <th>
                Dernière activité
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
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
               <%: String.Format("{0:g}", item.membership.LastActivityDate) %>
            </td>
        </tr>
    
    <% } %>

    </table>


</asp:Content>

