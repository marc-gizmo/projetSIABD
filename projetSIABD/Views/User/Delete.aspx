<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.UserModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Supprimer un utilisateur
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Supprimer un utilisateur</h2>

    <h3>Etes-vous sûr de vouloir supprimer l'utilisateur suivant ?</h3>
       
    <fieldset>
        <table>
            <tr>
                <th>Identifiant</th>
                <th>Nom</th>
                <th>Email</th>
                <th>Commentaire</th>
                <th>Autorisé</th>
            </tr>
            <tr>
                <td><%: Model.membership.userId %></td>
                <td><%: Model.UserName %></td>
                <td><%: Model.membership.Email %></td>
                <td><%: Model.membership.Comment %></td>
                <td><%: Model.membership.IsApproved %></td>
            </tr>
        </table>             
        
        
    </fieldset>
     <% using (Html.BeginForm())
       { %>
       <%: Html.ValidationSummary(true) %>
        <p>
         
		    <input type="submit" value="Supprimer" /> |
		    <%: Html.ActionLink("Index des utilisateurs", "Index")%>
        </p>
    <% } %>

</asp:Content>

