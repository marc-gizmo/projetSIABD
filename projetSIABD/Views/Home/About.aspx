<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Qui sommes-nous
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>À propos de nous</h2>
    <p>
        Nous sommes en 3° année à l'ENSIIE à Evry. <br />
        Ce projet à été réalisé dans le cadre de l'option SIABD.
    </p>
</asp:Content>
