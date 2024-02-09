<%@ Page Title="DVD Inventory" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Browse_DVD.aspx.cs" Inherits="CW2_AD.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div>
        <h1>Find out copy loan details</h1>
        <asp:Label ID="DVD_ID" runat="server" Text="DVD id"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="DVDTitle" DataValueField="DVDNumber">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
        <asp:Label ID="Copy_ID" runat="server" Text="Copy"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="DVDCopyNumber" DataValueField="DVDCopyNumber">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDCopy] WHERE ([DVDNumber] = @DVDNumber)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="DVDNumber" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LoanNumber" DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="LoanNumber" HeaderText="LoanNumber" InsertVisible="False" ReadOnly="True" SortExpression="LoanNumber" />
                <asp:BoundField DataField="CopyNumber" HeaderText="CopyNumber" SortExpression="CopyNumber" />
                <asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
                <asp:BoundField DataField="DateDue" HeaderText="DateDue" SortExpression="DateDue" />
                <asp:BoundField DataField="DateReturned" HeaderText="DateReturned" SortExpression="DateReturned" />
                <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                <asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT top 1 Loan.LoanNumber, Loan.CopyNumber, Loan.DateOut, Loan.DateDue, Loan.DateReturned, Member.MemberFirstName, Member.MemberLastName
FROM Loan 
inner join Member on Member.MemberNumber = Loan.MemberNumber 
inner join DVDCopy on DVDCopy.DVDCopyNumber = Loan.CopyNumber
inner join DVDTitle on DVDTitle.DVDNumber = DVDCopy.DVDNumber
where Loan.CopyNumber = @CopyNumber
order by Loan.DateOut Desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="CopyNumber" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <br />
    <br />
    <br />
    <div>
        <h1>Copy Loaned by Member</h1>
        <asp:Label ID="Label3" runat="server" Text="Member Last name"></asp:Label>
        <asp:TextBox ID="mem_lname" runat="server"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:Button ID="search_mem_loan" class="btn btn-primary" runat="server" OnClick="Search_mem_loan_Click" Text="search member loan" />
        <br />
        <asp:GridView class="table table-striped table-bordered" ID="copy_loan" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
                <asp:BoundField DataField="MemberName" HeaderText="MemberName" ReadOnly="True" SortExpression="MemberName" />
                <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
                <asp:BoundField DataField="DVDCopyNumber" HeaderText="DVDCopyNumber" SortExpression="DVDCopyNumber" />
                <asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT Member.MemberNumber, (Member.MemberFirstName + '' + Member.MemberLastName) as MemberName, DVDTitle.DVDTitle, DVDCopy.DVDCopyNumber, Loan.DateOut 
FROM Loan 
inner join Member on Loan.MemberNumber = Member.MemberNumber 
inner join DVDCopy ON Loan.CopyNumber = DVDCopy.DVDCopyNumber 
inner join DVDTitle on DVDCopy.DVDNumber = DVDTitle.DVDNumber 
WHERE Member.MemberLastName LIKE '%' + @MemberLastName + '%' and Loan.DateOut &gt;= GETDATE()-31;
">
            <SelectParameters>
                <asp:ControlParameter ControlID="mem_lname" Name="MemberLastName" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <div>
        <h1>Total loans in a day</h1>
        <asp:Button ID="loan_day_btn" class="btn btn-primary" runat="server" Text="Search for total loans each day" OnClick="Loan_day_btn_Click" />
        <br />
        <br />
        <asp:GridView class="table table-striped table-bordered" ID="loans_in_a_day" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberNumber" DataSourceID="SqlDataSource7">
            <Columns>
                <asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
                <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                <asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
                <asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
                <asp:BoundField DataField="MemberDateOfBirth" HeaderText="MemberDateOfBirth" SortExpression="MemberDateOfBirth" />
                <asp:BoundField DataField="MemberShipCategoryDescription" HeaderText="MemberShipCategoryDescription" SortExpression="MemberShipCategoryDescription" />
                <asp:BoundField DataField="MemberShipCategoryTotalLoans" HeaderText="MemberShipCategoryTotalLoans" SortExpression="MemberShipCategoryTotalLoans" />
                <asp:BoundField DataField="TotalLoans" HeaderText="TotalLoans" ReadOnly="True" SortExpression="TotalLoans" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select Member.MemberNumber,Member.MemberFirstName,Member.MemberLastName,Member.MemberAddress,Member.MemberDateOfBirth,MemberShipCategory.MemberShipCategoryDescription,MemberShipCategory.MemberShipCategoryTotalLoans, loancount.totalcount as TotalLoans from (select MemberNumber,count(*)as totalcount from Loan group by MemberNumber)loancount,Member,MemberShipCategory where Member.MembershipCategoryNumber=MemberShipCategory.MemberShipCategoryNumber and loancount.MemberNumber=Member.MemberNumber;"></asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <div>
        <h1>Penalty for late return</h1>
        <asp:GridView class="table table-striped table-bordered" ID="penalty" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8">
            <Columns>
                <asp:BoundField DataField="DateDue" HeaderText="DateDue" SortExpression="DateDue" />
                <asp:BoundField DataField="DateReturned" HeaderText="DateReturned" SortExpression="DateReturned" />
                <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                <asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
                <asp:BoundField DataField="Penalty" HeaderText="Penalty" ReadOnly="True" SortExpression="Penalty" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select Loan.DateDue, Loan.DateReturned, Member.MemberFirstName, Member.MemberLastName, (DATEDIFF(day,Loan.DateDue,Loan.DateReturned)*DVDTitle.PenaltyCharge) as Penalty
FROM Loan
inner join Member on Member.MemberNumber = Loan.MemberNumber 
inner join DVDCopy on DVDCopy.DVDCopyNumber = Loan.CopyNumber
inner join DVDTitle on DVDTitle.DVDNumber = DVDCopy.DVDNumber
where DATEDIFF(day,Loan.DateDue,Loan.DateReturned)&gt;0;"></asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <div>
        <h1>365 days old copies</h1>
        <asp:DropDownList ID="delete_dvd" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource9" DataTextField="DVDTitle" DataValueField="DVDTitle"></asp:DropDownList>
        <asp:Button ID="Delete_d" runat="server" Text="delete selected title" />
        <asp:GridView class="table table-striped table-bordered" ID="too_old" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" DataSourceID="SqlDataSource9" OnSelectedIndexChanged="Too_old_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
                <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
                <asp:BoundField DataField="dayInterval" HeaderText="dayInterval" ReadOnly="True" SortExpression="dayInterval" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select DVDTitle.DVDTitle, DVDTitle.DateReleased,DATEDIFF(day,DVDTitle.DateReleased,GETDATE())as dayInterval
from DVDTitle
where (DATEDIFF(day,DVDTitle.DateReleased,GETDATE())&gt;=365);" DeleteCommand="DELETE FROM DVDTitle WHERE DVDTitle = @DVDTitle;">
            <DeleteParameters>
                <asp:Parameter Name="DVDTitle" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <div>
        <h1>Member who havent borrowed any copy in last 31 days</h1>
        <asp:GridView class="table table-striped table-bordered" ID="not_borrow_31" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10">
            <Columns>
                <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                <asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
                <asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
                <asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
                <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
                <asp:BoundField DataField="dayInterval" HeaderText="dayInterval" ReadOnly="True" SortExpression="dayInterval" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select Member.MemberFirstName, Member.MemberLastName, Member.MemberAddress,Loan.DateOut,DVDTitle.DVDTitle,DATEDIFF(day,Loan.DateOut,GETDATE())as dayInterval 
FROM Loan
inner join Member on Member.MemberNumber = Loan.MemberNumber 
inner join DVDCopy on DVDCopy.DVDCopyNumber = Loan.CopyNumber
inner join DVDTitle on DVDTitle.DVDNumber = DVDCopy.DVDNumber
where (DATEDIFF(day,Loan.DateOut,GETDATE()))&gt;=31
order by Member.MemberFirstName,dayInterval ASC ;
"></asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <div>
        <h1>Not loaned copies in last 31 days</h1>
        <asp:GridView class="table table-striped table-bordered" ID="lonely_forever" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11">
            <Columns>
                <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select DVDTitle.DVDTitle
from DVDTitle 
except
select DVDTitle.DVDTitle
from Loan
inner join DVDCopy on Loan.CopyNumber = DVDCopy.DVDCopyNumber
inner join DVDTitle on DVDCopy.DVDNumber = DVDTitle.DVDNumber
where Loan.DateOut &gt;= GETDATE() - 31;"></asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <div>
        <h1>Too Many DVDs</h1>
        <asp:GridView class="table table-striped table-bordered" ID="loan_limit" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberNumber" DataSourceID="SqlDataSource12">
            <Columns>
                <asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
                <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                <asp:BoundField DataField="Mem_Age" HeaderText="Mem_Age" SortExpression="Mem_Age" ReadOnly="True" />
                <asp:BoundField DataField="MembershipCategoryDescription" HeaderText="MembershipCategoryDescription" SortExpression="MembershipCategoryDescription" />
                <asp:BoundField DataField="MembershipCategoryTotalLoans" HeaderText="MembershipCategoryTotalLoans" SortExpression="MembershipCategoryTotalLoans" />
                <asp:BoundField DataField="Mem_TotalLoan" HeaderText="Mem_TotalLoan" SortExpression="Mem_TotalLoan" ReadOnly="True" />
                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select m.MemberNumber ,
m.MemberFirstName,
(SELECT DATEDIFF(year, MemberDateOfBirth, GETDATE()) AS  mem_age) as Mem_Age,
MembershipCategory.MembershipCategoryDescription,
MembershipCategory.MembershipCategoryTotalLoans,
dat.Mem_TotalLoan,
Case when (dat.Mem_TotalLoan&gt;=MembershipCategory.MembershipCategoryTotalLoans) then 'Too many DVDs' else 'More to go' end as Remarks
from Member m
join MembershipCategory on m.MembershipCategoryNumber = MembershipCategory.MembershipCategoryNumber
left join
(select loan.MemberNumber, count(loan.membernumber) as Mem_TotalLoan
from Loan where loan.DateReturned is null
group by Loan.MemberNumber) as dat
on m.MemberNumber = dat.MemberNumber"></asp:SqlDataSource>
    </div>
</asp:Content>
