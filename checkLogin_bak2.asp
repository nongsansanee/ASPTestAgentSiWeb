<body>


<%
username = request.form("username")
password = request.form("password")



Dim data, httpRequest, postResponse

data = "username=" & username
data = data & "&password=" & password

response.write(data)
response.write("<br>")


Set httpRequest = Server.CreateObject("MSXML2.ServerXMLHTTP")

httpRequest.Open "POST", "https://10.7.14.14/test-agent", False

	If Err.Number Then
	
		Response.write("Could Not Open POST" & Err.Number & "-->" & Err.Description)
		Err.Clear
 
	End If

httpRequest.SetRequestHeader "Content-Type", "application/x-www-form-urlencoded"
 If Err.Number Then
	
    Response.write("Could Not set header" & Err.Number & "-->" & Err.Description)
    Err.Clear
 
 End If
  
//httpRequest.SetRequestHeader "Content-Type", "text/html; charset=UTF-8"
//httpRequest.SetRequestHeader "Content-Type", "application/json"

On Error Resume Next

httpRequest.Send data

  If Err.Number Then
	
    Response.write("Could Not Retrieve Status" & Err.Number & "-->" & Err.Description)
    Err.Clear
  Else
	Response.ContentType = "application/json"
    Response.write(httpRequest.ResponseText)
  End If
  
  On Error Goto 0
  Set httpRequest = nothing

//postResponse = httpRequest.ResponseText
//Response.Write postResponse 

//Response.ContentType = "application/json"
//Response.write(/* response from .14/test-agent */)





%>
</body>