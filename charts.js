

$(function () {
    $(document).ready(function () {
	
	
	var initialData=[];
	
	var1 = function(){
		var aaa= JSON.parse(serverVariable);
		return parseInt(aaa.X)};
	
	var2 = function(){
		var bbb = JSON.parse(serverVariable);
		return bbb.Y*100+1;};
	
	
        Highcharts.setOptions({
            global: {
                useUTC: false,
				pointStart:0
            }
        });

        $('#container').highcharts({
            chart: {
				pointStart:'0',
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
                tickPixelInterval: 150,		
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
                        'X: '+Highcharts.numberFormat(this.x,2) + '<br/>' +
                        'Y: '+Highcharts.numberFormat(this.y, 2);
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
                    // generate an array of random data for initial setup
						for(var i = -10;i<=0;i++){
							initialData.push({							
								x: i,
								y: Math.random()
							});
						}
                    return initialData;
                }())
            }]
        });
    });
});