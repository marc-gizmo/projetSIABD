<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.themesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	S'abonner à un thème
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>S'abonner à un thème</h2>

    <h3>Voulez-vous vraiment vous abonner au thème suivant ?</h3>
    <fieldset>
        
        <table>
            <tr>
                <th>Identifiant</th>
                <th>Nom du thème</th>
            </tr>
            <tr>
                <td><%: Model.themeId %></td>
                <td><%: Model.name %></td>
            </tr>
        </table>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="S'abonner" /> |
		    <%: Html.ActionLink("Index des thèmes", "Index") %>
        </p>
    <% } %>

</asp:Content>

