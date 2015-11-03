# server.R
 
shinyServer(function(input, output, session) {
	#global varible on x-axis
	x <- 0
	
	output$results = renderPrint({
        input$mydata
    })
	
	# observes if value of mydata sent from the client changes.  if yes
	# generate a new random color string and send it back to the client
	# handler function called 'myCallbackHandler'
	observe({
		input$mydata
		color = rgb(runif(1), runif(1), runif(1))
		
		session$sendCustomMessage(type = "myCallbackHandler", color)
	})
	
	autoUpdate <- reactiveTimer(1000,session)
	
	observe({
		autoUpdate()
		color = rgb(runif(1), runif(1), runif(1))		
		session$sendCustomMessage(type = "myCallbackHandler", color)
	})
	
	observe({
		autoUpdate()
		x <<- x + 10
		y = runif(1)
		
		variableToPassClient = sprintf('{"X":"%s", 
                          "Y": "%s"                          
                          }', x, y)

		session$sendCustomMessage(type="myDynamicCallbackHandler",variableToPassClient)
	})
	
 
})