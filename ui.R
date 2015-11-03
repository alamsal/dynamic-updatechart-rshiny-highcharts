# ui.R
 
shinyUI( bootstrapPage(   
   tags$script(src = "https://code.highcharts.com/highcharts.js"),
   tags$script(src = "https://code.highcharts.com/modules/exporting.js"),
   
  # handler to receive data from server
    tags$script('
    var dataFromServer;
    Shiny.addCustomMessageHandler("SendObjectToClientDynamicCallbackHandler",
      function(variables) {
        dataFromServer = variables;
        
      });
  '),

   # handler to receive custom data			
   tags$div(id ="container", style ="min-width: 310px; height: 400px; top:200px; position: relative"),
   includeScript("charts.js")   
 
))