<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="eChart3.aspx.cs" Inherits="WebApplication1.eChart3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/echarts.min.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <asp:Label ID="Label1" runat="server" Text="This is eChar3"></asp:Label>
    <input id="Button1" type="button" value="click to load data to chart" onClick="reloadData()"/>&nbsp;<div id="chart1" style="width:100%; height:600px"></div>
    <asp:Label ID="Label2" runat="server" Text="10 tries remain"></asp:Label>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById("chart1"));
        var base = 10;
        myChart.setOption(option = {
            title: {
                text: 'Confidence Band',
                subtext: 'Example in MetricsGraphics.js',
                left: 'center'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    animation: false
                },
                formatter: function (params) {
                    return params[2].name + '<br />' + params[2].value;
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: [],
                axisLabel: {
                    formatter: function (value, idx) {
                        var date = new Date(value);
                        return idx === 0 ? value : [date.getMonth() + 1, date.getDate()].join('-');
                    }
                },
                splitLine: {
                    show: false
                },
                boundaryGap: false
            },
            yAxis: {
                axisLabel: {
                    formatter: function (val) {
                        return (val - base) * 100 + '%';
                    }
                },
                splitNumber: 3,
                splitLine: {
                    show: false
                }
            },
            series: [{
                name: 'L',
                type: 'line',
                data: [],
                lineStyle: {
                    normal: {
                        opacity: 0
                    }
                },
                stack: 'confidence-band',
                symbol: 'none'
            }, {
                name: 'U',
                type: 'line',
                data: [],
                lineStyle: {
                    normal: {
                        opacity: 0
                    }
                },
                areaStyle: {
                    normal: {
                        color: '#ccc'
                    }
                },
                stack: 'confidence-band',
                symbol: 'none'
            }, {
                type: 'line',
                data: [],
                hoverAnimation: false,
                symbolSize: 6,
                itemStyle: {
                    normal: {
                        color: '#c23531'
                    }
                },
                showSymbol: false
            }]
        });

    </script>
    <script>
        var nTry = 0;
        function onClick() {
            alert('hello world!');
        }
        function reloadData() {
            myChart.showLoading();
            //$.get("data\confidence-band.txt", function (ds) {
            $.ajax({
                url: "confidence-band1.json", dataType: "json", success: function (data) {
                    
                    //alert('begin parse data');
                    //var data = JSON.parse(ds);
                    //var data = JSON.parse(JSON.stringify(ds));
                    //alert('finish parse data');
                    base = -data.reduce(function (min, val) {
                        return Math.floor(Math.min(min, val.l));
                    }, Infinity);

                    option = {
                        xAxis: {
                            data: data.map(function (item) {
                                return item.date;
                            })
                        },
                        series: [
                            {
                                data: data.map(function (item) {
                                    return item.l + base;
                                })
                            },
                            {
                                data: data.map(function (item) {
                                    return item.u - item.l;
                                })
                            },
                            {
                                data: data.map(function (item) {
                                    return item.value + base;
                                })
                            }
                        ]
                    };
                    myChart.setOption(option);
                    myChart.hideLoading();
                }, error: function (jqXHR, textStatus, errorThrown) {
                    //alert("error occured!");

                    nTry += 1;
                    if (nTry <= 10) {
                        setTimeout(reloadData, 5000);
                        $(document).ready(function () {
                            document.getElementById("<%=Label2.ClientID%>").innerHTML = nTry + ' tries remain';
                        });
                        
                    }
                    else {
                        alert('after 10 tries error occured');
                        console.log(textStatus, errorThrown);    
                    }
                    
                     
                    
                }
            });
            
        }
    </script>
</asp:Content>
