<%@ Page Title="Login" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CW2_AD.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login">
        <div>
            <center><u><asp:Label ID="log" runat="server" Font-Size="X-Large" Text="User Login"></asp:Label></u></center>  
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Email_login" runat="server" placeholder="email"></asp:TextBox>
            <br />
            <br />
            Password:<asp:TextBox ID="Password_login" runat="server" placeholder="password"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE (([Email] = @Email) AND ([UserPassword] = @UserPassword))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Email_login" Name="Email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="Password_login" Name="UserPassword" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </div>
</asp:Content>
