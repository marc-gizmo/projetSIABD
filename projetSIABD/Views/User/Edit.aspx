<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.UserModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editer un utilisateur
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editer un utilisateur</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            
            <table>
                <tr>
                    <th>Identifiant</th>
                    <th>Nom</th>
                </tr>
                <tr>
                    <td><%: Model.membership.userId%></td>
                    <td><%: Model.UserName %></td>
                </tr>
            </table>
            <%: Html.Hidden("membership.userId",Model.membership.userId) %>
            <%: Html.Hidden("UserName",Model.UserName) %>
            

            <div class="editor-label">
                <b>Email</b>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.membership.Email)%>
                <%: Html.ValidationMessageFor(model => model.membership.Email)%>
            </div>
            
            <div class="editor-label">
                <b>Commentaire</b>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.membership.Comment)%>
                <%: Html.ValidationMessageFor(model => model.membership.Comment)%>
            </div>
            
            
            
            
            <div class="editor-label">
                <b>Autorisé</b>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.membership.IsApproved)%>
                <%: Html.ValidationMessageFor(model => model.membership.IsApproved)%>
            </div>
           
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Index des utilisateurs", "Index") %>
    </div>

</asp:Content>

