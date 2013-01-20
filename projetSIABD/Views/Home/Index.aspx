<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Page d'accueil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <p>
        Connectez vous pour accéder au contenu du site.
        <br />
        
        <%
            if (Request.IsAuthenticated) {
        %>
                Bienvenue <b><%: Page.User.Identity.Name %></b>!
                <br /><br />
                <%: Html.ActionLink("Accéder au fil d'actualité", "NewsFeed", "Messages", null, new { @class = "btn" }) %>
                 <%: Html.ActionLink("Fermer la session", "LogOff", "Account", null, new { @class = "btn" })%> 
        <%
        }
        else {
        %> 
             <%: Html.ActionLink("Ouvrir une session", "LogOn", "Account", null, new { @class = "btn" })%> 
        <%
        }
        %>
    </p>
</asp:Content>
