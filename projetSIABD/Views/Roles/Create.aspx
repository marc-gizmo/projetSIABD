<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Créer un nouveau rôle.
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Créer un nouveau rôle.</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
           
                       
            <div class="editor-label">
                Insérer le nom du Role à créer.
            </div>
            <div class="editor-field">
                <%: Html.TextBox("RoleName") %>
            </div>
            
            <p>
                <input type="submit" value="Créer" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Index des rôles", "Index") %>
    </div>

</asp:Content>

