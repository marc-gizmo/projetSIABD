<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.themesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Supprimer un thème
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Supprimer un thème</h2>

    <h3>Etes-vous sûr de vouloir supprimer le thème suivant ?</h3>
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
            <%: Html.HiddenFor(model => Model.themeId) %>
            <%: Html.HiddenFor(model => Model.name) %>
       
		    <input type="submit" value="Supprimer" /> |
		    <%: Html.ActionLink("Index des thèmes", "Index") %>
        </p>
    <% } %>

</asp:Content>

