<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.Models.BossModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th>
                UserName
            </th>
            <th>
                Email
            </th>
            <th>
                Comment
            </th>
            <th>
                IsApproved
            </th>
            <th>
                IsLockedOut
            </th>
            <th>
                Last Activity Date
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.UserName %>
            </td>
            <td>
                <%: item.membership.Email %>
            </td>
            <td>
                <%: item.membership.Comment %>
            </td>
            <td>
                <%: item.membership.IsApproved %>
            </td>
            <td>
                <%: item.membership.IsLockedOut %>
            </td>
            <td>
               <%: String.Format("{0:g}", item.membership.LastActivityDate) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

