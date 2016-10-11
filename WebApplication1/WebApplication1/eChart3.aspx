<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="eChart3.aspx.cs" Inherits="WebApplication1.eChart3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/echarts.min.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <asp:Label ID="Label1" runat="server" Text="This is eChar3"></asp:Label>
    <input id="Button1" type="button" value="click to load data to chart" onClick="reloadData()"/>&nbsp;<div id="chart1" style="width:100%; height:600px"></div>
    <asp:Label ID="Label2" runat="server" Text="10 tries remain"></asp:Label>
    <script type="text/javascript">
        var _data;
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
            legend: {
                data: ['1st value line', '2nd value line'],
                align: 'left'
            },
            dataZoom: {
                type: 'slider',
                start: 0,
                end: 100,
                xAxisIndex: 0
            },
            dataZoom:{
                type: 'inside',
                xAxisIndex: 0,
                start: 0,
                end: 100
            },
            dataZoom: {
            type: 'slider',
            start: 0,
            end: 100,
            yAxisIndex: 0
            },
            dataZoom:{
                type: 'inside',
                yAxisIndex: 0,
                start: 0,
                end: 100
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
                        color: 'Aqua'
                    }
                },
                stack: 'confidence-band',
                symbol: 'none'
            }, {
                //name: 'val1',
                type: 'line',
                data: [],
                hoverAnimation: false,
                symbolSize: 6,
                itemStyle: {
                    normal: {
                        color: 'Red'
                    }
                },
                showSymbol: false
            }, {
                name:'L2',
                type: 'line',
                data: [],
                lineStyle: {
                    normal: {opacity:0}
                },
                stack: 'confidence-band',
                symbol:'none'
            }, {
                name: 'U2',
                type: 'line',
                data: [],
                lineStyle: { normal: { opacity: 0 } },
                areaStyle: {
                    normal: {
                        color: 'Beige'
                    }
                },
                stack: 'confidence-band',
                symbol:'none'
            }, {
                //name: 'val2',
                type: 'line',
                data: [],
                hoverAnimation: false,
                symbolSize: 6,
                itemStyle: {
                    normal: {
                        color: 'Blue'
                    }
                },
                showSymbol: false

            }

            ]
        });
        myChart.on('mouseover', function (params) {
            console.log(params);
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
                url: "Data/GBProfiles.json", dataType: "json", success: function (data0) {
                    
                    //alert('begin parse data');
                    //var data = JSON.parse(ds);
                    //var data = JSON.parse(JSON.stringify(ds));
                    //alert('finish parse data');
                    _data = data0;
                    var data = data0.Profiles[0].Batches[0].Data;
                    var data1 = data0.Profiles[0].Batches[1].Data;
                    base = -data.reduce(function (min, val) {
                        return Math.floor(Math.min(min, val.l));
                    }, Infinity);
                    alert('base is ' + base);
                    option = {
                        legend: {
                            data: [_data.Profiles[0].name + "-" + _data.Profiles[0].Batches[0].BatchId + ' Value']
                        },
                        xAxis: {
                            //data: data.map(function (item) {
                            //    return item.ts;
                            //})
                            data: $.map(data,function(item){
                                return item.ts;
                            })
                        },
                        series: [
                            {
                                /*
                                data: data.map(function (item) {
                                    return item.l + base;
                                })
                                */
                                data: $.map(data, function (item) {
                                    return item.l + base;
                                    })
                            },
                            {
                                /*
                                data: data.map(function (item) {
                                    return item.u - item.l;
                                })
                                */
                                data: $.map(data, function (item) {
                                    return item.u - item.l;
                                    })
                            },
                            {
                                //name: _data.Profiles[0].name + "-" + _data.Profiles[0].Batches[0].BatchId + ' Value',
                                name: '1st value line',
                                data: data.map(function (item) {
                                    return item.v + base;
                                })
                            },
                            {
                                data: data1.map(function(item){
                                    return item.l + base;
                                })
                            },
                            {
                                data: data1.map(function (item) {
                                    return item.u - item.l;
                                })
                            },
                            {
                                name: '2nd Value line',
                                data: data1.map(function (item) {
                                    return item.v + base;
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
