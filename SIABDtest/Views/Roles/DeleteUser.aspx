<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.RolesWithUserModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DeleteUser
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>DeleteUser</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        <table>
            <tr>
                <th>UserId</th>
                <th>UserName</th>
                <th>RoleId</th>
                <th>RoleName</th>
            </tr>
            <tr>
                <td><%: Model.UserId %></td>
                <td><%: Model.UserName %></td>
                <td><%: Model.RoleId %></td>
                <td><%: Model.RoleName %></td>
            </tr>
        </table>
        
        
    </fieldset>
    <% using (Html.BeginForm("DeleteUser2","Roles")) { %>
        <p>
            <%: Html.HiddenFor(model => Model.UserId) %>
            <%: Html.HiddenFor(model => Model.UserName) %>
            <%: Html.HiddenFor(model => Model.RoleId) %>
            <%: Html.HiddenFor(model => Model.RoleName) %>
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

