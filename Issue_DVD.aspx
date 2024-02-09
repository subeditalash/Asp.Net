<%@ Page Title="" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Issue_DVD.aspx.cs" Inherits="CW2_AD.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6 align-self-center">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>DVD Loan</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="mem_id" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MemberNumber" DataValueField="MemberNumber"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>DVD ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:DropDownList ID="dvd_id" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="DVDNumber" DataValueField="DVDNumber"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="mem_fname" runat="server" placeholder="Member First Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>DVD Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dvd_name" runat="server" placeholder="DVD Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="mem_lname" runat="server" placeholder="Member Last Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>DVD Copy Number</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DVDcopies" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="DVDCopyNumber" DataValueField="DVDCopyNumber"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="loan_dob" runat="server" Text="Date of birth"></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="dob_for_loan" runat="server" placeholder="Date of Birth" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Loan Type</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="loan_type" runat="server" AutoPostBack="True" OnSelectedIndexChanged="membership_type_SelectedIndexChanged">
                                        <asp:ListItem Value="LT1">Weekly</asp:ListItem>
                                        <asp:ListItem Value="LT2">Monthly</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT DVDCopyNumber FROM DVDCopy WHERE ([DVDNumber] = @DVDNumber)
EXCEPT
SELECT CopyNumber FROM Loan WHERE DateReturned IS NULL;">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="dvd_id" Name="DVDNumber" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Date loaned</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="start_date" runat="server" placeholder="Date loaned" ReadOnly="True" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date due</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="end_date" runat="server" placeholder="Date due" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <br />
                                <asp:Button class="btn btn-primary" ID="show_data" runat="server" Text="Generate info" OnClick="show_data_Click" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="btn_issue_loan" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue Loan" OnClick="btn_issue_loan_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="Home.aspx"><< Back to Home</a><br>
                <br>
            </div>
            <div class="col-md-6 align-self-center">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>DVD Return Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Loan Number</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="loan_no" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="LoanNumber" DataValueField="LoanNumber"></asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Loan] WHERE DateReturned is NULL"></asp:SqlDataSource>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <br />
                                <asp:Button CssClass="form-control btn btn-block btn-primary" ID="search_loan" runat="server" Text="search loan" OnClick="search_loan_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="loan_mem_fname" runat="server" placeholder="fisrt name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Member Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="loan_mem_lname" placeholder="last name" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>DVD Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dvd_on_loan" placeholder="dvd name" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>DVD Copy Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dvd_copy_on_loan" placeholder="dvd copy" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Loan Type</label>
                                <asp:TextBox CssClass="form-control" ID="loan_type_of_mem" placeholder="loan type" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Date loaned</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="date_loaned_fr" runat="server" placeholder="Date loaned" ReadOnly="True" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date due</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="date_due_fr" runat="server" placeholder="Date due" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Date Returned" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="date_return_fr" runat="server" placeholder="Returned Date" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="return_save" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="return_save_Click" />
                                <asp:SqlDataSource ID="update_loan" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM Loan where LoanNumber = @loan_no" UpdateCommand="UPDATE [Loan] SET [DateReturned] = @date_return_fr WHERE ([LoanNumber] = @loan_no)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="loan_no" Name="loan_no" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="date_return_fr" />
                                        <asp:Parameter Name="loan_no" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Loan List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView class="table table-striped table-bordered" ID="loan_view" runat="server" AutoGenerateColumns="False" DataKeyNames="LoanNumber" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="LoanNumber" HeaderText="LoanNumber" InsertVisible="False" ReadOnly="True" SortExpression="LoanNumber" />
                                        <asp:BoundField DataField="LoanTypeNumber" HeaderText="LoanTypeNumber" SortExpression="LoanTypeNumber" />
                                        <asp:BoundField DataField="CopyNumber" HeaderText="CopyNumber" SortExpression="CopyNumber" />
                                        <asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" SortExpression="MemberNumber" />
                                        <asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
                                        <asp:BoundField DataField="DateDue" HeaderText="DateDue" SortExpression="DateDue" />
                                        <asp:BoundField DataField="DateReturned" HeaderText="DateReturned" SortExpression="DateReturned" />
                                        <asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" SortExpression="DVDNumber" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Loan]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Penalty Charge</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView class="table table-striped table-bordered" ID="Penalty_view" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6">
                                    <Columns>
                                        <asp:BoundField DataField="DateDue" HeaderText="DateDue" SortExpression="DateDue" />
                                        <asp:BoundField DataField="DateReturned" HeaderText="DateReturned" SortExpression="DateReturned" />
                                        <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                                        <asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
                                        <asp:BoundField DataField="Penalty" HeaderText="Penalty" ReadOnly="True" SortExpression="Penalty" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select Loan.DateDue, Loan.DateReturned, Member.MemberFirstName, Member.MemberLastName, (DATEDIFF(day,Loan.DateDue,Loan.DateReturned)*DVDTitle.PenaltyCharge) as Penalty
FROM Loan
inner join Member on Member.MemberNumber = Loan.MemberNumber 
inner join DVDCopy on DVDCopy.DVDCopyNumber = Loan.CopyNumber
inner join DVDTitle on DVDTitle.DVDNumber = DVDCopy.DVDNumber
where DATEDIFF(day,Loan.DateDue,Loan.DateReturned)&gt;0;"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
