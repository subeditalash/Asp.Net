<%@ Page Title="User profile" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="User_profile.aspx.cs" Inherits="CW2_AD.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 align-self-center">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Details</h4>
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
                                <label>User Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="user_name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label1" runat="server" Text="User Type"></asp:Label>
                                <asp:DropDownList CssClass="form-control" ID="user_type" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Staff</asp:ListItem>
                                </asp:DropDownList>
                               
                            </div>
                        </div>
                        <br />
                        <div class="row">
                             <div class="col-md-12">
                                    <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="DOB" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="user_pass_label" runat="server" Text="User Password"></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="User_pass" runat="server" placeholder="password"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="c_pass" runat="server" Text="Confirm Password"></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="Confirm_pass" runat="server" placeholder="confirm password"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="add_user" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Add_user_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="update" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Update_Click" />
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="UPDATE Users SET UserPassword = @password WHERE (Email = @email)" UpdateCommand="UPDATE Users SET UserPassword = @password WHERE (Email = @email)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Confirm_pass" Name="password" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="Email" Name="email" PropertyName="Text" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="password" />
                                        <asp:Parameter Name="email" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
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
                                    <asp:Label ID="list_title" runat="server" Text="Users List"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="user_view" runat="server" AutoGenerateColumns="False" DataKeyNames="UserNumber" DataSourceID="SqlDataSource2" AllowSorting="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnSelectedIndexChanged="user_view_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="UserNumber" HeaderText="UserNumber" ReadOnly="True" SortExpression="UserNumber" InsertVisible="False" />
                                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                        <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                                        <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="Date_of_Birth" HeaderText="Date_of_Birth" SortExpression="Date_of_Birth" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
