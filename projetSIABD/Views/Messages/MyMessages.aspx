<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.newsFeedModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Mes messages
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Mes messages</h2>

<table>
<% foreach (var item in Model.ListOfNew) { %>
    <tr>
        <th>
            Le <%: Html.DisplayFor(modelItem => item.nouvelle.nouvelle.date.DayOfYear)%>/<%: Html.DisplayFor(modelItem => item.nouvelle.nouvelle.date.Month)%>
        </th>
        <th>
            <%: Html.DisplayFor(modelItem => item.nouvelle.author) %> a écrit : 
        </th>
        <th>
            " <%: Html.DisplayFor(modelItem => item.nouvelle.nouvelle.content)%> "
        </th>
        <th>
            <%: Html.DisplayFor(modelItem => item.nouvelle.nouvelle.themesdbs.name)%>
        </th>
        <th>
            <% if (item.nouvelle.nouvelle.author == Model.currentUser)
               { %>
                 <%: Html.ActionLink("Supprimer mon message", "DeleteMyMessage", new { id = item.nouvelle.nouvelle.messageID })%>
            <% } %>
        </th>
        <th>
            <% if (Model.isAdmin == true)
               {%>
                     <%: Html.ActionLink("Modérer ce message", "ModerateMessage", new { id = item.nouvelle.nouvelle.messageID })%>
            <% } %>
        </th>
    </tr>
    <% //here begin the comments %>
    <% foreach (var helper in item.associatedComments) { %>
    <tr>
    <td></td>
        <td>
            <%: Html.DisplayFor(modelItem => helper.author)%> a commenté ce message : 
        </td>
        <td>
           " <%: Html.DisplayFor(modelItem => helper.content) %> "
        </td>
        <td></td>
        <td>
            <% if (helper.author == Model.currentUser)
               { %>
                 <%: Html.ActionLink("Supprimer mon commentaire", "DeleteMyComment", "Comments", new { id = item.nouvelle.nouvelle.messageID }, null)%>
            <% } %>
        </td>
        <td>
            <% if (Model.isAdmin == true)
               {%>
                     <%: Html.ActionLink("Modérer ce commentaire", "ModerateComment", "Comments", new { id = item.nouvelle.nouvelle.messageID }, null)%>
            <% } %>
        </td>
    </tr>
    <% } %>
    <tr>
        <td>
            <%: Html.ActionLink("Commenter la nouvelle", "CreateAComment", "Comments", new { id = item.nouvelle.nouvelle.messageID }, null)%>
        </td>
    </tr>
    <tr>
        <% if (item.likes.Where(a => a.liker.Equals(Model.currentUser)).Count() == 0) { %>         
        <td>
            <%: Html.ActionLink("J'aime", "LikeANew", "Like", new { id = item.nouvelle.nouvelle.messageID }, null)%>
        </td>
        <td>
            <% if (item.nbLikes > 1) { %> 
            <%: item.nbLikes %> personnes aiment ce message
            <% } else if (item.nbLikes == 1){%>
            une personne aime ce message
            <% } else { %>
            soyez le premier a aimer ce message !
            <% } %>
        </td>
        <% } else {%>
        <td>
            <%: Html.ActionLink("Je n'aime plus", "DislikeANew", "Like", new { id = item.nouvelle.nouvelle.messageID }, null)%>
        </td>
        <td>
            <% if (item.nbLikes > 1) { %> 
            vous et <%: item.nbLikes - 1 %> personnes aiment ce message
            <% } else {%>
            vous aimez ce message
            <% } %>
        </td>
        <% } %>
    </tr>
    <tr><td><br /></td></tr>

<% } %>

</table>

</asp:Content>

