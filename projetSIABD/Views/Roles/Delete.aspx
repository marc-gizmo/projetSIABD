<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.my_aspnet_roles>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Supprimer un rôle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Supprimer un rôle</h2>

    <h3>Etes-vous sûr de vouloir supprimer le rôle suivant ?</h3>
    <fieldset>
       
        <table>
            <tr>
                <th>Identifiant</th>
                <th>Nom du rôle</th>
            </tr>
            <tr>
                <td><%: Model.id %></td>
                <td><%: Model.name %></td>
            </tr>
        </table>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
            <%: Html.HiddenFor(model => Model.id) %>
            <%: Html.HiddenFor(model => Model.name) %>
            <%: Html.HiddenFor(model => Model.applicationId) %>
            <input type="submit" value="Supprimer" /> |
		    <%: Html.ActionLink("Index des rôles", "Index") %>
        </p>
    <% } %>

</asp:Content>

