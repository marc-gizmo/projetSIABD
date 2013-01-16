<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<projetSIABD.Models.UserModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
           
            <th>
                userId
            </th>
            <th>
                userName
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
             <th></th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
          
            <td>
                <%: item.membership.userId %>
            </td>
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
                <%: Html.ActionLink("Edit", "Edit", new { id=item.membership.userId }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.membership.userId })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.membership.userId })%>
            </td>
           
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

