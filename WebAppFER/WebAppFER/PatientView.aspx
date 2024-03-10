<%@ Page Title="Patient View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientView.aspx.cs" Inherits="WebAppFER.PatientView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main style="text-align: -webkit-center; padding: 12rem 0; background-size: 100% 100%; background-image: url('img/GetStartedBackImg.png');">
        <div class="card text-center" style="width: 80%; font-family: 'SF Pro Display'">
            <div class="card-header" style="font-size: x-large; font-weight: bold;">Patient Info</div>
            <div class="card-body" style="text-align: left; margin: 1rem -10rem 1rem 10rem">
                <div class="row">
                    <div class="col-md-6">
                        <p class="card-text">
                            Name:
                <asp:Label runat="server" ID="lbName"></asp:Label>
                        </p>
                        <p class="card-text">
                            Illness:
                <asp:Label runat="server" ID="lbIllness"></asp:Label>
                        </p>
                    </div>
                    <div class="col-md-6">
                        <p class="card-text">
                            Age:
                <asp:Label runat="server" ID="lbAge"></asp:Label>
                        </p>
                        <p class="card-text">
                            Email:
                <asp:Label runat="server" ID="lbEmail"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
            <style>
                p {
                    font-weight: bold;
                    font-size: large;
                }

                    p > * {
                        font-weight: normal;
                        font-size: large;
                    }
            </style>
            <hr>
            <div style="align-items: center">
                <h1 style="font-size: x-large; font-weight: bold">Historic Data</h1>
                <div>
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <p style="color: grey; font-size: small">Last 7 day</p>
                    <div style="padding: 0rem 3rem 1rem 3rem">
                        <canvas id="myChart" style="width: 80%; height: 100%"></canvas>
                        <script>
                            var ctx = document.getElementById('myChart').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'],
                                    datasets: [
                                        {
                                            label: 'BPM',
                                            data: [65, 59, 80, 81, 56, 55, 40],
                                            backgroundColor: 'rgba(0, 123, 255, 0.2)',
                                            borderColor: 'rgba(0, 123, 255, 1)',
                                            borderWidth: 1
                                        }, 
                                        {
                                            label: 'Temp',
                                            data: [35, 36, 37, 35, 37, 35, 38],
                                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                            borderColor: 'rgba(255, 99, 132, 1)',
                                            borderWidth: 1
                                        }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                        </script>
                    </div>
                </div>
            </div>
            <div class="card-footer text-body-secondary">
                <asp:Button ID="btnBack" runat="server" Text="Go Back" class="btn btn-dark" CommandName="Select" OnCommand="GoBack" />
                <%--<<asp:Button runat="server" type="button" class="btn btn-dark" style="border-radius: 2rem;" OnClick="GoBack" Go Back/>--%>
            </div>
        </div>
    </main>
</asp:Content>
