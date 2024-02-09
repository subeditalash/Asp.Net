<%@ Page Title="Search by last name" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Search_by_last_name.aspx.cs" Inherits="CW2_AD.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top: 10px;">
        <h1>Search by last name</h1>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
        &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Actor_lname" runat="server" AutoCompleteType="Enabled"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
            &nbsp;<asp:Button ID="Search_by_lname" class="btn btn-primary" runat="server" Text="Search by Last name" OnClick="Search_by_lname_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="lname_copies" class="btn btn-primary" runat="server" Text="search for no of copies available on the shelves " OnClick="Lname_copies_Click" />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select Distinct
DVDTitle.DVDNumber,
DVDTitle.DVDTitle,
DVDTitle.DateReleased,
Count(DVDCopy.DVDCopyNumber) AS Copies_on_Shelf
from DVDTitle
inner join DVDCopy on DVDTitle.DVDNumber = DVDCopy.DVDNumber 
inner join CASTMEMBER ON DVDTitle.DVDNumber = CastMember.DVDNumber
inner join Actor ON CastMember.ActorNumber= Actor.ActorNumber
inner join Loan on DVDCopy.DVDCopyNumber=Loan.CopyNumber 
where Actor.ActorSurname Like '%'+@ActorSurName+'%'
and Loan.DateReturned is null
GROUP BY DVDTitle.DVDNumber, DVDTitle.DVDTitle, DVDTitle.DateReleased">
            <SelectParameters>
                <asp:ControlParameter ControlID="Actor_lname" Name="ActorSurName" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT DISTINCT d.DVDNumber, d.DVDTitle, d.DateReleased FROM DVDTitle AS d INNER JOIN CastMember AS c ON d.DVDNumber = c.DVDNumber INNER JOIN Actor AS a ON c.ActorNumber = a.ActorNumber WHERE (a.ActorSurName LIKE '%' + @ActorSurName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="Actor_lname" Name="ActorSurName" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
        <br />
        <asp:GridView class="table table-striped table-bordered" ID="lname_SearchData" runat="server" AutoGenerateColumns="False" DataKeyNames="DVDNumber">
            <Columns>
                <asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" ReadOnly="True" SortExpression="DVDNumber" />
                <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
                <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:GridView class="table table-striped table-bordered" ID="lname_copies_on_shelves" runat="server">
        </asp:GridView>
        <br />
    </div>
</asp:Content>
