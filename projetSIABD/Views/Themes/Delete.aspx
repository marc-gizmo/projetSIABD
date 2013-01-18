<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.themesdbs>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        <table>
            <tr>
                <th>ThemeId</th>
                <th>ThemeName</th>
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
       
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

