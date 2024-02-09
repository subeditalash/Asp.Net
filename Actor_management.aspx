<%@ Page Title="" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Actor_management.aspx.cs" Inherits="CW2_AD.WebForm7" %>
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
                                        <h4>Actor Details</h4>
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
                                <label>Actor ID</label>
                                <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="actor_id" runat="server" placeholder="ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Actor firstname</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="actor_fn" runat="server" placeholder="Actor firstname"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Actor lastname</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="actor_ln" runat="server" placeholder="Actor lastname"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="add_actor" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="Add_actor_Click" />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="select * from [Actor] where ([ActorNumber]=@actor_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="actor_id" Name="actor_id" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="col-6">
                                <asp:Button ID="delete_category" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />
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
                                        <h4>Actors List</h4>
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
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical">
                                    <asp:GridView class="table table-striped table-bordered" ID="Actor_view" runat="server" AutoGenerateColumns="False" DataKeyNames="ActorNumber" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="ActorNumber" HeaderText="ActorNumber" ReadOnly="True" SortExpression="ActorNumber" />
                                        <asp:BoundField DataField="ActorSurName" HeaderText="ActorSurName" SortExpression="ActorSurName" />
                                        <asp:BoundField DataField="ActorFirstName" HeaderText="ActorFirstName" SortExpression="ActorFirstName" />
                                    </Columns>
                                </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Actor]"></asp:SqlDataSource>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
