<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="COMP4952Medium.AdminPage.Admin" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>Admin Page</p>

<h3>View User Roles</h3>

<asp:Label id="Msg" ForeColor="maroon" runat="server" /><br />
<div style="background-color: #009DA9">
    <asp:Repeater runat="server" ID="rptrUsers">
        <HeaderTemplate>
            <table class="table">
                <tr>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
        </HeaderTemplate>
            
        <ItemTemplate>
            <asp:HiddenField runat="server" ID="userID" Value='<%# DataBinder.Eval(Container.DataItem, "Id").ToString() %>' />
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem, "UserName") %></td>
                <td><%# getUserRole(DataBinder.Eval(Container.DataItem, "Id").ToString()) %></td>
                <td>
                    <asp:Button ID="lockOutUser" runat="server" CausesValidation="false" OnClick="lockOutUser_Click" Text="Lockout" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id").ToString() %>' />
                    |<asp:Button ID="lockInUser" runat="server" CausesValidation="false" OnClick="lockInUser_Click" Text="Lockin" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id").ToString() %>' />
                    |<asp:Button ID="deleteUser" runat="server" CausesValidation="false" OnClick="deleteUser_Click" Text="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id").ToString() %>' />
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</div>
</asp:Content>
