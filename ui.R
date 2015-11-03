# ui.R
 
shinyUI( bootstrapPage(
   
   tags$script(src = "https://code.highcharts.com/highcharts.js"),
   tags$script(src = "https://code.highcharts.com/modules/exporting.js"),
   
  # a div named mydiv
  tags$div(id="mydiv", style="width: 50px; height :50px;
           left: 100px; top: 100px;
           background-color: red; position: absolute"),
 
  # a shiny element to display unformatted text
  verbatimTextOutput("results"),
  
  # javascript code to send data to shiny server
  tags$script('
    document.getElementById("mydiv").onclick = function() {
      var number = Math.random();	   
      Shiny.onInputChange("mydata", number);
    };
  '),

  
  # handler to receive data from server
	tags$script('
	  Shiny.addCustomMessageHandler("myCallbackHandler",
			function(color) {
			  document.getElementById("mydiv").style.backgroundColor = color;
			});
	'),
	
    tags$script('
    var serverVariable;
    Shiny.addCustomMessageHandler("myDynamicCallbackHandler",
      function(variables) {
        serverVariable = variables;
        
      });
  '),

   # handler to receive custom data			
   tags$div(id ="container", style ="min-width: 310px; height: 400px; top:500px; position: relative"),
   includeScript("charts.js")
   
 
))