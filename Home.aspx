<%@ Page Title="Home" Language="C#" MasterPageFile="~/Coursework2.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CW2_AD.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <center>
            <h1>Browse your favourite DVDs here.</h1>
            <br />
            <p style="font-size: 18px;">Welcome to the official Ropey's DVD website. Here you can browse and loan your favourite DVDs.</p>
        </center>
    </section>
            <asp:GridView class="table table-striped table-bordered" ID="DVDview" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Font-Size="Large" OnSelectedIndexChanged="DVDview_SelectedIndexChanged" DataKeyNames="DVDNumber">
                <Columns>
                    <asp:BoundField DataField="DVDNumber" HeaderText="DVD ID" SortExpression="DVDNumber" ReadOnly="True" />
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("DVDTitle") %>' Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                Studio: <asp:Label ID="Label2" runat="server" Text='<%# Eval("StudioName") %>'></asp:Label>   <b>|</b>   Producer:<asp:Label ID="Label3" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label><br />
                                                Genre: <asp:Label ID="Label4" runat="server" Text='<%# Eval("CategoryDescription") %>'></asp:Label>  <b>|</b> Age-Restricted:<asp:Label ID="Label9" runat="server" Text='<%# Eval("AgeRestricted") %>'></asp:Label>&nbsp;<asp:Label style="color:red;" ID="Label10" runat="server" Text="(0 means false, 1 means true)"></asp:Label> <br />
                                                Cast Members: <asp:Label ID="Label5" runat="server" Text='<%# Eval("Cast") %>'></asp:Label><br />
                                                Date Released: <asp:Label ID="Label6" runat="server" Text='<%# Eval("DateReleased") %>'></asp:Label><br />
                                                Price: Standard charge:<asp:Label ID="Label7" runat="server" Text='<%# Eval("StandardCharge") %>'></asp:Label> <b>|</b> Penalty charge:<asp:Label ID="Label8" runat="server" Text='<%# Eval("PenaltyCharge") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("DVDCover") %>' Height="250px" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDVDsConnectionString %>" SelectCommand="SELECT DVDTitle.DVDNumber,DVDTitle.DVDTitle, DVDTitle.DateReleased, DVDTitle.StandardCharge, DVDTitle.PenaltyCharge, DVDTitle.DVDCover, DVDCategory.CategoryDescription, DVDCategory.AgeRestricted, Producer.ProducerName, Studio.StudioName, string_agg(concat(Actor.ActorFirstName, ' ' , Actor.ActorSurname), ',') within GROUP(ORDER BY Actor.ActorSurname) AS Cast FROM DVDTitle INNER JOIN DVDCategory ON DVDTitle.CategoryNumber = DVDCategory.CategoryNumber INNER JOIN Producer ON DVDTitle.ProducerNumber = Producer.ProducerNumber INNER JOIN Studio ON DVDTitle.StudioNumber = Studio.StudioNumber INNER JOIN CastMember ON DVDTitle.DVDNumber = CASTMEMBER.DVDNumber INNER JOIN Actor ON CastMember.ActorNumber = Actor.ActorNumber GROUP BY DVDTitle.DVDNumber, DVDTitle.DVDTitle, DVDTitle.DateReleased, DVDTitle.DVDCover, DVDCategory.CategoryDescription, DVDTitle.StandardCharge, DVDTitle.PenaltyCharge, DVDCategory.AgeRestricted, Producer.ProducerName, Studio.StudioName ORDER BY DVDTitle.DateReleased;" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>     
</asp:Content>
