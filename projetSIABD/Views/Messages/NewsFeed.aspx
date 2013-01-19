<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.newsFeedModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Fil d'actualité
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Fil d'actualité</h2>

<h2>Publier une nouvelle</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<p>
    <%: Html.ActionLink("Publier une nouvelle", "CreateANew") %>
</p>

<h2>Dernières parutions</h2>

<table>
    <tr>
        <th>
            messageID
        </th>
        <th>
            date
        </th>
        <th>
            utilisateursdbs
        </th>
        <th>
            content
        </th>
        <th>
            themesdbs
        </th>
        <th>
            censored
        </th>
        <th>
            important
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model.ListOfNew) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.nouvelle.messageID) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.nouvelle.date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.nouvelle.author) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.nouvelle.content) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.nouvelle.themesdbs.name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.nouvelle.censored) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.nouvelle.important) %>
        </td>
    </tr>
    <% //here begin the comments %>
    <% foreach (var helper in item.associatedComments) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => helper.messagesdbs.content) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => helper.messagesdbs.author) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => helper.content) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => helper.date) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=helper.ID }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=helper.ID }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=helper.ID }) %>
        </td>
    </tr>
    <% } %>
    <tr>
        <td>
            <%: Html.ActionLink("Commenter la nouvelle", "CreateAComment", "Comments", new { id=item.nouvelle.messageID }) %>
        </td>
    </tr>
    <tr>
        <% if (item.likes.Where(a => a.liker.Equals(Model.currentuser)).Count() == 0) { %>         
        <td>
            <%: Html.ActionLink("J'aime", "LikeANew", "Like", new { id=item.nouvelle.messageID }, null) %>
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
            <%: Html.ActionLink("Je n'aime plus", "DislikeANew", "Like", new { id=item.nouvelle.messageID }, null) %>
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

<% } %>

</table>

</asp:Content>

