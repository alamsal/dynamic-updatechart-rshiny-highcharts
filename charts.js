var1 = function(){
    var aaa= JSON.parse(serverVariable);
    return parseInt(aaa.X)};
var2 = function(){
    var bbb = JSON.parse(serverVariable);
    return bbb.Y*100+1;};

$(function () {
    $(document).ready(function () {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });

        $('#container').highcharts({
            chart: {
                type: 'spline',
                animation: Highcharts.svg, // don't animate in old IE
                marginRight: 10,
                events: {
                    load: function () {

                        // set up the updating of the chart each second
                        var series = this.series[0];
                        setInterval(function () { 
                            console.log(var1() +"--"+ var2())
                            series.addPoint([var1(),var2()], true, true);
                        }, 1000);
                    }
                }
            },
            title: {
                text: 'Live random data'
            },
            xAxis: {
                type: 'integer',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: 'Value'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + '</b><br/>' +
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'Random data',
                data: (function () {
                    // generate an array of random data
                    var data = [],
                        time =0,
                        i;

                    for (i = 1; i <= 20; i += 1) {
						time = time
                        data.push({							
                            x: i * 100,
                            y: Math.random()
                        });
                    }
                    return data;
                }())
            }]
        });
    });
});