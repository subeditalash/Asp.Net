<%@ Page Title="Manage Category" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Category_management.aspx.cs" Inherits="CW2_AD.category" %>
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
                                        <h4>Category Details</h4>
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
                                <label>Category ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="cat_id" runat="server" placeholder="ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4"> 
                                <label>Age Restricted</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="cat_age_restrict" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>
                                </div>  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <label>Category Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="cat_name" runat="server" placeholder="Category Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="add_category" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="Add_category_Click" />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select * from [DVDCategory] where ([CategoryNumber]=@cat_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cat_id" Name="cat_id" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="delete_category" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Category List</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="Cat_view" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryNumber" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="CategoryNumber" HeaderText="CategoryNumber" ReadOnly="True" SortExpression="CategoryNumber" />
                                        <asp:BoundField DataField="CategoryDescription" HeaderText="CategoryDescription" SortExpression="CategoryDescription" />
                                        <asp:BoundField DataField="AgeRestricted" HeaderText="AgeRestricted" SortExpression="AgeRestricted" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [DVDCategory]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
