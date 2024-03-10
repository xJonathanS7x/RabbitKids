<%@ Page Title="Patients" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="WebAppFER.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dot-menu__checkbox {
            display: none;
        }

        .dot-menu__label {
            position: relative;
            display: block;
            width: 45px;
            height: 45px;
            background-color: #6b97f8;
            border-radius: 45px;
            margin: 0 auto;
            transition: background-color 0.2s linear;
            cursor: pointer;
        }

            .dot-menu__label:before,
            .dot-menu__label:after,
            .dot-menu__label span:before {
                content: "";
                position: absolute;
                left: 19.5px;
                width: 6px;
                height: 6px;
                border-radius: 6px;
                background-color: #fff;
                transition: 0.4s;
            }

            .dot-menu__label:before {
                top: 28.5px;
            }

            .dot-menu__label:after {
                top: 10.5px;
            }

            .dot-menu__label span:before {
                top: 19.5px;
            }

        .dot-menu__checkbox:checked ~ .dot-menu__label:before {
            transform: rotate(224deg) translate(14px, -1px);
            transform-origin: center center;
            width: 60%;
        }

        .dot-menu__checkbox:checked ~ .dot-menu__label:after {
            transform: rotate(136deg) translate(14px, 1px);
            transform-origin: center center;
            width: 60%;
        }

        .card-body {
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: 1fr;
        }

            .card-body > asp:GridView {
                align-self: center;
                justify-self: center;
            }

        .gridTable {
            border: 2px solid white;
            border-collapse: separate;
            border-spacing: 1px;
            width: 100%;
        }

            .gridTable th {
                border: 2px solid #bfbfbf;
                background-color: #bfbfbf;
            }

            .gridTable td {
                border: 2px solid #bfbfbf;
                text-align: center;
            }
    </style>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">



    <main style="text-align: -webkit-center; padding: 12rem 0; background-size: 100% 100%; background-image: url('img/RobotsBackImg.png');">
        <div class="card text-center" style="width: 80%; font-family: 'SF Pro Display'">
            <div class="card-header" style="font-size: x-large; font-weight: bold; /">Patients</div>
            <div class="card-body">
                <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="false" CssClass="gridTable">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Illness" HeaderText="Illness" />
                        <asp:BoundField DataField="Age" HeaderText="Age" />
                        <asp:TemplateField ShowHeader="False" ItemStyle-Width="100px">
                            <%--                                <itemtemplate>
                                    <asp:Button ID="btnSelect" runat="server" Text="Details" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' Style="border: none; background: #bfbfbf; font-weight: bold; border-radius: 0.25rem" />
                                </itemtemplate>--%>
                            <ItemTemplate>
                                <asp:Button ID="btnSelect" runat="server" Text="Details" data-bs-toggle="modal" data-bs-target="#infoPatient" Style="border: none; background: #bfbfbf; font-weight: bold; border-radius: 0.25rem; color:black" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' OnCommand="btnSelect_Command" />
<%--                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#infoPatient" data-name='<%# Eval("ID") %>' style="border: none; background: #bfbfbf; font-weight: bold; border-radius: 0.25rem; color: black" commandname="Select">Details</button>--%>
                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="card-footer text-body-secondary">
                <button type="button" class="btn btn-dark" style="border-radius: 2rem;">Add New Patient</button>
            </div>
        </div>
    </main>
</asp:Content>
