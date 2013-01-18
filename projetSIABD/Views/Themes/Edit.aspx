<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.ThemeEditModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Editer le thême</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.theme.themeId) %>
            </div>
            <div class="editor-field">
                <%: Model.theme.themeId %>
                <%: Html.HiddenFor(model => model.theme.themeId) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.theme.name) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.theme.name) %>
                <%: Html.ValidationMessageFor(model => model.theme.name) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

    <fieldset>
        <legend>Controler les abonnés. (<%: Model.abonnements.Count() %> abonné(s))</legend>
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

