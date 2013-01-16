<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.my_aspnet_roles>" %>

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
                <th>id</th>
                <th>RoleName</th>
            </tr>
            <tr>
                <td><%: Model.id%></td>
                <td><%: Model.name %></td>
            </tr>
        </table>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
            <%: Html.HiddenFor(model => Model.id)%>
            <%: Html.HiddenFor(model => Model.name) %>
            <%: Html.HiddenFor(model => Model.applicationId) %>
            <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

