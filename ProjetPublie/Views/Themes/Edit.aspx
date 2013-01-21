<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.ThemeEditModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editer un thème
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editer un thème</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <h3>Editer le thême</h3>
            
            <div class="editor-label">
                <b>Identifiant</b>
            </div>
            <div class="editor-field">
                <%: Model.theme.themeId %>
                <%: Html.HiddenFor(model => model.theme.themeId) %>
            </div>
            
            <div class="editor-label">
                <b>Nom du thème</b>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.theme.name) %>
                <%: Html.ValidationMessageFor(model => model.theme.name) %>
            </div>
            
            <p>
                <input type="submit" value="Editer" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Index des thèmes", "Index") %>
    </div>

    <fieldset>
        <h3>Controler les abonnés. (<%: Model.abonnements.Count() %> abonné(s))</h3>
        <table>
            <tr>
                <th>Numéro d'abonnement</th>
                <th>Nom d'utilisateur</th>
                <th></th>
            </tr>
            <% foreach (var item in Model.abonnements)
               { %>
            <tr>
                <td><%: item.abonnement.ID %></td>
                <td><%: item.user.name %></td>
                <td>
                    <%: Html.ActionLink("Supprimer l'abonnement","DelUser", new { id = item.abonnement.ID }) %>
                </td>

            </tr>
            <% } %>    
        </table>
    </fieldset>

</asp:Content>

