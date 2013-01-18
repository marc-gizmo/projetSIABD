<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.themesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddUser
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>AddUser</h2>

    <h3>Voulez-vous vraiment vous abonner au thème suivant ?</h3>
    <fieldset>
        <legend>Fields</legend>
        <table>
            <tr>
                <th>Id du thème</th>
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
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

