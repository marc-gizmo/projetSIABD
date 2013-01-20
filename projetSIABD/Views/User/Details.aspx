<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.UserModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
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
            
            
        </tr>
    
        <tr>
          
            <td>
                <%: Model.membership.userId %>
            </td>
            <td>
                <%: Model.UserName %>
            </td>
            <td>
                <%: Model.membership.Email %>
            </td>
            <td>
                <%: Model.membership.Comment %>
            </td>
            
            <td>
                <%: Model.membership.IsApproved %>
            </td>
                        
           
        </tr>
    


    </table>
                     
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.membership.userId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

