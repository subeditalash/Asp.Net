<%@ Page Title="" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Studio_management.aspx.cs" Inherits="CW2_AD.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Studio Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Studio ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="studio_id" runat="server" placeholder="ID"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Studio Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="studio_name" runat="server" placeholder="Studio Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="add_studio" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="Add_studio_Click" />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select * from [Studio] where ([StudioNumber]=@studio_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="studio_id" Name="studio_id" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <div class="col-4">
                                <asp:Button ID="delete_studio" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="Home.aspx"><< Back to Home</a><br>
                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Studio List</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="Studio_view" runat="server" AutoGenerateColumns="False" DataKeyNames="StudioNumber" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="StudioNumber" HeaderText="StudioNumber" ReadOnly="True" SortExpression="StudioNumber" />
                                        <asp:BoundField DataField="StudioName" HeaderText="StudioName" SortExpression="StudioName" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Studio]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
