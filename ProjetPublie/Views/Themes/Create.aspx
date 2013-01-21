<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.themesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Créer un nouveau thème
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
                          
            
            <div class="editor-label">
                <b>Nom du thème</b>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.name) %>
                <%: Html.ValidationMessageFor(model => model.name) %>
            </div>
            
            <p>
                <input type="submit" value="Créer" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Index des thèmes", "Index") %>
    </div>

</asp:Content>

