<%@ Page Title="" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Producer_management.aspx.cs" Inherits="CW2_AD.WebForm5" %>
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
                                        <h4>Producer Details</h4>
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
                                <label>Producer ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="producer_id" runat="server" placeholder="ID"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Producer Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="producer_name" runat="server" placeholder="Producer Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="add_producer" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="add_producer_Click" />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="Select * from [Producer] where [ProducerNumber] = @producer_id">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="producer_id" Name="producer_id" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="delete_producer" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />
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
                                        <h4>Producer List</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="Producer_view" runat="server" AutoGenerateColumns="False" DataKeyNames="ProducerNumber" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="ProducerNumber" HeaderText="ProducerNumber" ReadOnly="True" SortExpression="ProducerNumber" />
                                        <asp:BoundField DataField="ProducerName" HeaderText="ProducerName" SortExpression="ProducerName" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
