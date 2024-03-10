<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppFER.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main style="text-align: -webkit-center; padding: 5rem 0; background-size: 100% 100%; background-image: url('img/LoginBackImg.png');">
        <div class="card" style="max-width: 30rem; border-radius: 1.5rem; padding: 2rem;  font-family: 'SF Pro Display';">
            <div class="card-body">
                <div style="text-align: center;">
                    <h1 style="font-weight: bold">Log In</h1>
                </div>
                <div class="input-group mb-3" style="justify-content: center; padding-top: 2rem;">
                    <input type="text" class="form-control" placeholder="User Name" aria-label="Username" aria-describedby="basic-addon1" style="border-radius: 0.5rem;">
                </div>
                <div class="input-group mb-3" style="justify-content: center;">
                    <input type="password" class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1" style="border-radius: 0.5rem;">
                </div>
                <p>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#">Forgot Password?</asp:HyperLink>
                </p>
            </div>
            <div style="padding-top: 0.5rem;">
                <asp:Button ID="Login" runat="server" Text="Log In" CssClass="LoginBtn" style="background:#009aff; border-radius:2rem"/>
            </div>
        </div>

    </main>
</asp:Content>
