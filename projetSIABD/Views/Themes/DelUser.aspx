<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.ThemeDelUserModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DelUser
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>DelUser</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
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
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

