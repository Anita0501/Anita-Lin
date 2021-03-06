﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_06_CompanyScaleChart.aspx.cs" Inherits="CRM_06_CompanyChart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="/Scripts/utils.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料統計</li>
    <li class="breadcrumb-item">客戶公司規模統計圖</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <asp:button id="ExcelBtn" runat="server" text="匯出列表" cssclass="btn btn-info" onclick="ExcelBtn_Click" />
    <asp:label id="MsgLab" runat="server" text=""></asp:label>

    <div class="container  chartjs-render-monitor" style="width: 75%">
        <canvas id="myChart"></canvas>
    </div>
    <div id="myToolTip" style="position: absolute">
        <p></p>
    </div>
    <asp:hiddenfield id="CompanyScaleHiddenField" runat="server" />
    <asp:hiddenfield id="CountHiddenField" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: document.getElementById("MainContentPlaceHolder_CompanyScaleHiddenField").value.split(","),
                datasets: [{
                    labels: '客戶公司規模',
                    data: document.getElementById("MainContentPlaceHolder_CountHiddenField").value.split(","),
                    backgroundColor:
                    [
                        'rgba(255, 99, 132,0.5)',
                        'rgba(255, 159, 64,0.5)',
                        'rgba(255, 205, 86,0.5)',
                        'rgba(75, 192, 192,0.5)',
                        'rgba(54, 162, 235,0.5)',
                        'rgba(153, 102, 255,0.5)',
                        'rgba(231,233,237,0.5)'
                    ],
                }]
            },
            options: {
                title: {
                    display: true,
                    text: '客戶公司規模統計圖',
                    fontSize: 40,
                    //fontStyle: 'bold'
                },
                legend: {
                    display: true,
                    position: 'bottom',
                    labels: {
                        fontSize: 20,
                        fontStyle: 'bold'
                    }
                },
                hover: {
                    mode: 'label',
                    animationDuration: 10000
                },
                tooltips: {
                    bodyFontSize: 20,
                }
            }
        });

    </script>
</asp:Content>

