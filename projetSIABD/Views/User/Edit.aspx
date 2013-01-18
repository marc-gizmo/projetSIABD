<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<projetSIABD.Models.UserModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.membership.userId) %>
            </div>
            <div class="editor-field">
                <%: Model.membership.userId%>
                <%: Html.Hidden("membership.userId",Model.membership.userId) %>
            </div>
            
            <div class="editor-label"> Username </div>
            <div class="editor-field"><%: Model.UserName %></div>
            <%: Html.Hidden("UserName",Model.UserName) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.membership.Email) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.membership.Email)%>
                <%: Html.ValidationMessageFor(model => model.membership.Email)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.membership.Comment)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.membership.Comment)%>
                <%: Html.ValidationMessageFor(model => model.membership.Comment)%>
            </div>
            
            
            
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.membership.IsApproved)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.membership.IsApproved)%>
                <%: Html.ValidationMessageFor(model => model.membership.IsApproved)%>
            </div>
            
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.membership.IsLockedOut)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.membership.IsLockedOut)%>
                <%: Html.ValidationMessageFor(model => model.membership.IsLockedOut)%>
            </div>
           
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

