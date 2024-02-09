<%@ Page Title="Add DVD" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Add_DVD.aspx.cs" Inherits="CW2_AD.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>DVD Details</h4>
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
                                <label>DVD ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dvd_id" runat="server" placeholder="DVD ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>DVD Name</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="dvd_name" runat="server" placeholder="DVD Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Studio Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="studio_name" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="StudioName" DataValueField="StudioNumber"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Studio]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Producer Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="producer_name" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ProducerName" DataValueField="ProducerNumber"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Category Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="Cat_name" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="CategoryDescription" DataValueField="CategoryNumber"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDCategory]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Release Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="release_date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Standard Charge</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="std_chrg" placeholder="standard charge" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Penalty Charge</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="pen_chrg" placeholder="penalty charge" runat="server" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>Total Copies</label>
                                <asp:TextBox  CssClass="form-control" ID="total_copies" placeholder="total copies" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-12">
                                <%--<asp:Button ID="Button1" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" />--%>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="add_dvd" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="Add_dvd_Click" />
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="Select * from [DVDTitle] where [DVDNumber] = @dvd_id">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dvd_id" Name="dvd_id" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" DeleteCommand="DELETE FROM [DVDTitle] WHERE [DVDNumber] = @original_DVDNumber AND [CategoryNumber] = @original_CategoryNumber AND [StudioNumber] = @original_StudioNumber AND [ProducerNumber] = @original_ProducerNumber AND [DVDTitle] = @original_DVDTitle AND [DateReleased] = @original_DateReleased AND [StandardCharge] = @original_StandardCharge AND [PenaltyCharge] = @original_PenaltyCharge AND (([DVDCover] = @original_DVDCover) OR ([DVDCover] IS NULL AND @original_DVDCover IS NULL)) AND (([AvailableCopies] = @original_AvailableCopies) OR ([AvailableCopies] IS NULL AND @original_AvailableCopies IS NULL))" InsertCommand="INSERT INTO [DVDTitle] ([DVDNumber], [CategoryNumber], [StudioNumber], [ProducerNumber], [DVDTitle], [DateReleased], [StandardCharge], [PenaltyCharge], [DVDCover], [AvailableCopies]) VALUES (@DVDNumber, @CategoryNumber, @StudioNumber, @ProducerNumber, @DVDTitle, @DateReleased, @StandardCharge, @PenaltyCharge, @DVDCover, @AvailableCopies)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DVDTitle] WHERE (([DVDNumber] = @DVDNumber) AND ([CategoryNumber] = @CategoryNumber) AND ([StudioNumber] = @StudioNumber) AND ([ProducerNumber] = @ProducerNumber) AND ([DateReleased] = @DateReleased) AND ([StandardCharge] = @StandardCharge) AND ([PenaltyCharge] = @PenaltyCharge) AND ([AvailableCopies] = @AvailableCopies))" UpdateCommand="UPDATE [DVDTitle] SET [CategoryNumber] = @CategoryNumber, [StudioNumber] = @StudioNumber, [ProducerNumber] = @ProducerNumber, [DVDTitle] = @DVDTitle, [DateReleased] = @DateReleased, [StandardCharge] = @StandardCharge, [PenaltyCharge] = @PenaltyCharge, [DVDCover] = @DVDCover, [AvailableCopies] = @AvailableCopies WHERE [DVDNumber] = @original_DVDNumber AND [CategoryNumber] = @original_CategoryNumber AND [StudioNumber] = @original_StudioNumber AND [ProducerNumber] = @original_ProducerNumber AND [DVDTitle] = @original_DVDTitle AND [DateReleased] = @original_DateReleased AND [StandardCharge] = @original_StandardCharge AND [PenaltyCharge] = @original_PenaltyCharge AND (([DVDCover] = @original_DVDCover) OR ([DVDCover] IS NULL AND @original_DVDCover IS NULL)) AND (([AvailableCopies] = @original_AvailableCopies) OR ([AvailableCopies] IS NULL AND @original_AvailableCopies IS NULL))">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_DVDNumber" Type="String" />
                                        <asp:Parameter Name="original_CategoryNumber" Type="String" />
                                        <asp:Parameter Name="original_StudioNumber" Type="String" />
                                        <asp:Parameter Name="original_ProducerNumber" Type="String" />
                                        <asp:Parameter Name="original_DVDTitle" Type="String" />
                                        <asp:Parameter DbType="Date" Name="original_DateReleased" />
                                        <asp:Parameter Name="original_StandardCharge" Type="Int32" />
                                        <asp:Parameter Name="original_PenaltyCharge" Type="Int32" />
                                        <asp:Parameter Name="original_DVDCover" Type="String" />
                                        <asp:Parameter Name="original_AvailableCopies" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter Name="DVDNumber" Type="String" ControlID="dvd_id.Text"/>
                                        <asp:ControlParameter Name="CategoryNumber" Type="String" ControlID="Cat_name.SelectedValue"/>
                                        <asp:ControlParameter Name="StudioNumber" Type="String" ControlID="Studio_name.SelectedValue"/>
                                        <asp:ControlParameter Name="ProducerNumber" Type="String" ControlID="Producer_name.SelectedValue"/>
                                        <asp:ControlParameter Name="DVDTitle" Type="String" ControlID=""/>
                                        <asp:ControlParameter DbType="Date" Name="DateReleased" ControlID=""/>
                                        <asp:ControlParameter Name="StandardCharge" Type="Int32" ControlID=""/>
                                        <asp:ControlParameter Name="PenaltyCharge" Type="Int32" ControlID=""/>
                                        <asp:ControlParameter Name="DVDCover" Type="String" ControlID=""/>
                                        <asp:ControlParameter Name="AvailableCopies" Type="Int32" ControlID=""/>
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dvd_id" Name="DVDNumber" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="Cat_name" Name="CategoryNumber" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="studio_name" Name="StudioNumber" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="producer_name" Name="ProducerNumber" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="release_date" DbType="Date" Name="DateReleased" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="std_chrg" Name="StandardCharge" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="pen_chrg" Name="PenaltyCharge" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="total_copies" Name="AvailableCopies" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="CategoryNumber" Type="String" />
                                        <asp:Parameter Name="StudioNumber" Type="String" />
                                        <asp:Parameter Name="ProducerNumber" Type="String" />
                                        <asp:Parameter Name="DVDTitle" Type="String" />
                                        <asp:Parameter DbType="Date" Name="DateReleased" />
                                        <asp:Parameter Name="StandardCharge" Type="Int32" />
                                        <asp:Parameter Name="PenaltyCharge" Type="Int32" />
                                        <asp:Parameter Name="DVDCover" Type="String" />
                                        <asp:Parameter Name="AvailableCopies" Type="Int32" />
                                        <asp:Parameter Name="original_DVDNumber" Type="String" />
                                        <asp:Parameter Name="original_CategoryNumber" Type="String" />
                                        <asp:Parameter Name="original_StudioNumber" Type="String" />
                                        <asp:Parameter Name="original_ProducerNumber" Type="String" />
                                        <asp:Parameter Name="original_DVDTitle" Type="String" />
                                        <asp:Parameter DbType="Date" Name="original_DateReleased" />
                                        <asp:Parameter Name="original_StandardCharge" Type="Int32" />
                                        <asp:Parameter Name="original_PenaltyCharge" Type="Int32" />
                                        <asp:Parameter Name="original_DVDCover" Type="String" />
                                        <asp:Parameter Name="original_AvailableCopies" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="Home.aspx"><< Back to Home
                </a>
                <br>
                <br>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>DVD List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="DVD_details" runat="server" AutoGenerateColumns="False" DataKeyNames="DVDNumber" DataSourceID="SqlDataSource4">
                                    <Columns>
                                        <asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" SortExpression="DVDNumber" ReadOnly="True"></asp:BoundField>
                                        <asp:BoundField DataField="CategoryNumber" HeaderText="CategoryNumber" SortExpression="CategoryNumber"></asp:BoundField>
                                        <asp:BoundField DataField="StudioNumber" HeaderText="StudioNumber" SortExpression="StudioNumber"></asp:BoundField>
                                        <asp:BoundField DataField="ProducerNumber" HeaderText="ProducerNumber" SortExpression="ProducerNumber"></asp:BoundField>
                                        <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle"></asp:BoundField>
                                        <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased"></asp:BoundField>
                                        <asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" SortExpression="StandardCharge" />
                                        <asp:BoundField DataField="PenaltyCharge" HeaderText="PenaltyCharge" SortExpression="PenaltyCharge" />
                                        <asp:BoundField DataField="DVDCover" HeaderText="DVDCover" SortExpression="DVDCover" />
                                        <asp:BoundField DataField="AvailableCopies" HeaderText="AvailableCopies" SortExpression="AvailableCopies" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
