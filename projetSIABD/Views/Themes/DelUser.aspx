<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.ThemeDelUserModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Supprimer un abonnement
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Supprimer un abonnement</h2>

    <h3>Etes-vous sûr de vouloir supprimer l'abonnement suivant ?</h3>
    <fieldset>
        
        <table>
            <tr>
                <th>Numéro d'abonnement</th>
                <th>Nom du thème</th>
                <th>Nom d'utilisateur</th>
            </tr>
            <tr>
                <td><%: Model.abonneId %></td>
                <td><%: Model.ThemeName %></td>
                <td><%: Model.UserName %></td>
            </tr>
        </table>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Supprimer" /> |
		    <%: Html.ActionLink("Index des thèmes", "Index") %>
        </p>
    <% } %>

</asp:Content>

