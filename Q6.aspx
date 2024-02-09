<%@ Page Title="Details" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Q6.aspx.cs" Inherits="CW2_AD.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <asp:DropDownList ID="member_id" runat="server" DataSourceID="SqlDataSource2" DataTextField="MemberFirstName" DataValueField="MemberNumber" OnSelectedIndexChanged="member_id_SelectedIndexChanged"></asp:DropDownList>
            </div>
        <div class="row">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
            <asp:GridView class="table table-striped table-bordered" ID="member" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberNumber" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
                    <asp:BoundField DataField="MembershipCategoryNumber" HeaderText="MembershipCategoryNumber" SortExpression="MembershipCategoryNumber" />
                    <asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
                    <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                    <asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
                    <asp:BoundField DataField="MemberDateOfBirth" HeaderText="MemberDateOfBirth" SortExpression="MemberDateOfBirth" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Member] WHERE ([MemberNumber] = @MemberNumber)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="member_id" Name="MemberNumber" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="row">
            <asp:DropDownList ID="dvd_title" runat="server" DataSourceID="SqlDataSource3" DataTextField="DVDTitle" DataValueField="DVDNumber"></asp:DropDownList>
            </div>
            <div class="row">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
            <asp:GridView class="table table-striped table-bordered" ID="dvd" runat="server" AutoGenerateColumns="False" DataKeyNames="DVDNumber,CategoryNumber1" DataSourceID="SqlDataSource4" Width="100%">
                <Columns>
                    <asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" ReadOnly="True" SortExpression="DVDNumber" />
                    <asp:BoundField DataField="CategoryNumber" HeaderText="CategoryNumber" SortExpression="CategoryNumber" />
                    <asp:BoundField DataField="StudioNumber" HeaderText="StudioNumber" SortExpression="StudioNumber" />
                    <asp:BoundField DataField="ProducerNumber" HeaderText="ProducerNumber" SortExpression="ProducerNumber" />
                    <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
                    <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
                    <asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" SortExpression="StandardCharge" />
                    <asp:BoundField DataField="PenaltyCharge" HeaderText="PenaltyCharge" SortExpression="PenaltyCharge" />
                    <asp:BoundField DataField="DVDCover" HeaderText="DVDCover" SortExpression="DVDCover" />
                    <asp:BoundField DataField="AvailableCopies" HeaderText="AvailableCopies" SortExpression="AvailableCopies" />
                    <asp:BoundField DataField="CategoryNumber1" HeaderText="CategoryNumber1" ReadOnly="True" SortExpression="CategoryNumber1" />
                    <asp:BoundField DataField="CategoryDescription" HeaderText="CategoryDescription" SortExpression="CategoryDescription" />
                    <asp:BoundField DataField="AgeRestricted" HeaderText="AgeRestricted" SortExpression="AgeRestricted" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * 
FROM DVDTitle 
inner join DvdCategory on DvdCategory.CategoryNumber = DVDTitle.CategoryNumber where DVDTitle.DVDNumber = @dvd_id and DvdCategory.AgeRestricted = 0;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dvd_title" Name="dvd_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="row">
            <asp:DropDownList ID="mem_cat_id" runat="server" DataSourceID="SqlDataSource5" DataTextField="MembershipCategoryDescription" DataValueField="MembershipCategoryNumber"></asp:DropDownList>
            </div>
            <div class="row">
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [MembershipCategory]"></asp:SqlDataSource>
            <asp:GridView class="table table-striped table-bordered" ID="mem_category" runat="server" AutoGenerateColumns="False" DataKeyNames="MembershipCategoryNumber" DataSourceID="SqlDataSource6">
                <Columns>
                    <asp:BoundField DataField="MembershipCategoryNumber" HeaderText="MembershipCategoryNumber" ReadOnly="True" SortExpression="MembershipCategoryNumber" />
                    <asp:BoundField DataField="MembershipCategoryDescription" HeaderText="MembershipCategoryDescription" SortExpression="MembershipCategoryDescription" />
                    <asp:BoundField DataField="MembershipCategoryTotalLoans" HeaderText="MembershipCategoryTotalLoans" SortExpression="MembershipCategoryTotalLoans" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [MembershipCategory] WHERE ([MembershipCategoryNumber] = @MembershipCategoryNumber)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="mem_cat_id" Name="MembershipCategoryNumber" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="row">
            <asp:GridView class="table table-striped table-bordered" ID="loan" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7">
                <Columns>
                    <asp:BoundField DataField="TotalLoan" HeaderText="TotalLoan" ReadOnly="True" SortExpression="TotalLoan" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT Count( * ) as TotalLoan
from Loan 
where Loan.MemberNumber = @member_id and Loan.DateReturned is null;
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="member_id" Name="member_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="row">
            <asp:GridView class="table table-striped table-bordered" ID="loan_charge" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8">
                <Columns>
                    <asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" ReadOnly="True" SortExpression="StandardCharge" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT 
(DATEDIFF(day,Loan.DateOut,Loan.DateDue)*DVDTitle.StandardCharge) as StandardCharge
FROM Loan
inner join Member on Member.MemberNumber = Loan.MemberNumber 
inner join DVDCopy on DVDCopy.DVDCopyNumber = Loan.CopyNumber
inner join DVDTitle on DVDTitle.DVDNumber = DVDCopy.DVDNumber
where Loan.MemberNumber=@member_id and Loan.DateReturned is null;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="member_id" Name="member_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
