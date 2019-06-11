<body>


<%
user_name = request.form("username")
passwd = request.form("password")



response.ContentType = "application/json"



If (user_name="iamlucky") and (passwd="lovelove")  Then 
	// case positive
    //response.write("Welcome to THAILAND")
	response.write("{""reply_code"":1,""reply_text"":""ok""}")

Else
	// case negative
	//response.write("!!!Ops. Unknown You!!!")
	response.write("{""reply_code"":0,""reply_text"":""failed""}")

End If

%>
</body>