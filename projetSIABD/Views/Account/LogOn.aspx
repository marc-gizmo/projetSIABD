﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Ouverture de session
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ouverture de session</h2>
    <p>
        Vous n'êtes pas connecté ou vous n'avez pas les autorisations nécessaires pour accéder à cette page.
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Échec de la connexion. Corrigez les erreurs et réessayez.") %>
        <div>
            <fieldset>
                
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    <%: Html.LabelFor(m => m.RememberMe) %>
                </div>
                
                <p>
                    <input type="submit" value="Ouverture de session" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
