<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.RoleAddModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Attribuer un rôle à un utilisateur
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Attribuer un rôle à un utilisateur</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            
            
            Veuillez choisir le rôle et l'utilisateur :
            <div> Role :
                <%: Html.DropDownList("RoleName",Model.RolesName) %>
            </div>
            <div> Utilisateur :
                <%: Html.DropDownList("UserName",Model.UsersName) %>
            </div>
            <p>
                <input type="submit" value="Attribuer" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Index des rôles", "Index") %>
    </div>

</asp:Content>

