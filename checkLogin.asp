<body>


<%
username = request.form("username")
password = request.form("password")



Dim data, httpRequest, postResponse

data = "username=" & username
data = data & "&password=" & password

//response.write(data)
//response.write("<br>")


//Microsoft.XMLHTTP
//MSXML2.ServerXMLHTTP

 Set httpRequest = Server.CreateObject("MSXML2.ServerXMLHTTP")
 


//	On Error Resume Next
  //httpRequest.SetOption(2, httpRequest.GetOption(2) - SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID)
  httpRequest.setOption(2) = SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS
 //   If Err.Number Then
	
//		Response.write("Could Not SetOption" & Err.Number & "-->" & Err.Description)
//		Err.Clear
//	Else
		
//		Response.write(httpRequest.ResponseText)
//	End If
  
  On Error Resume Next
  httpRequest.Open "POST", "https://10.7.14.14/test-agent", false 
 
   If Err.Number Then
	
		Response.write("Could NotGET" & Err.Number & "-->" & Err.Description)
		Err.Clear
  Else
		
		Response.write(httpRequest.ResponseText)
  End If
 
  httpRequest.SetRequestHeader "Content-Type", "application/x-www-form-urlencoded"

  On Error Resume Next
 
  //httpRequest.Send "username=billie&password=palitchoke"
 
  // httpRequest.Send
  
	httpRequest.Send data
 

 
  // If Err.Number Then
	
 //   Response.write("Could Not Retrieve Status" & Err.Number & "-->" & Err.Description)
 //   Err.Clear
 // Else
	
  //  Response.write(httpRequest.ResponseText)
 // End If
  
 
  
  //On Error Goto 0
 // Set httpRequest = nothing
 
 
// response.write("Send")
 
 Response.ContentType = "application/json"
 Response.Write httpRequest.responseText



//response.write("<br>")
//response.write("END")



%>
</body>