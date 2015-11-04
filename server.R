# server.R
 
shinyServer(function(input, output, session) {
	#global varible on x-axis
	x <- 0
	
	# observes if value of mydata sent from the client changes.  if yes
	# generate a new random color string and send it back to the client
	# handler function called 'SendObjectToClientDynamicCallbackHandler'

	
	autoUpdate <- reactiveTimer(1000,session)

	
	observe({
		autoUpdate()
		x <<- x + 10
		y = runif(1)
		
		#pass data to client as object - x & y are passed to client from server on every second
		variableToPassClient = sprintf('{"X":"%s", 
                          "Y": "%s"                          
                          }', x, y)

		session$sendCustomMessage(type="SendObjectToClientDynamicCallbackHandler",variableToPassClient)
	})
	
 
})