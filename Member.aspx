<%@ Page Title="Add member" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="CW2_AD.Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login">
        <div>
            <center><u><asp:Label ID="add" runat="server" Font-Size="X-Large" Text="Add Member"></asp:Label></u></center>  
            <br />
            <br />
            Member Fisrt Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Member_fname" runat="server" placeholder="text" TabIndex="1"></asp:TextBox>
            <br />
            <br />
            Member Last Name:<asp:TextBox ID="Member_lname" runat="server" placeholder="text" TabIndex="2"></asp:TextBox>
            <br />
            <br />
            Membership Category:<asp:DropDownList ID="Membership_cat" runat="server" TabIndex="3" DataSourceID="SqlDataSource1" DataTextField="MembershipCategoryDescription" DataValueField="MembershipCategoryNumber" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [MembershipCategory]"></asp:SqlDataSource>
            <br />
            <br />
            Memvber address:<asp:TextBox ID="Member_address" runat="server" placeholder="text" TabIndex="4"></asp:TextBox>
            <br />
            <br />
            Member D.O.B:<asp:TextBox ID="Member_dob" runat="server" placeholder="date" TabIndex="5" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_add_member" runat="server" Text="Add member" OnClick="btn_add_member_Click"/>
            <br />
        </div>
        
    </div>
</asp:Content>
