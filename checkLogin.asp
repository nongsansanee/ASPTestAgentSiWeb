<body>


<%
user_name = request.form("username")
passwd = request.form("pwd")

response.ContentType = "application/json"
//response.write(request.form("username"))
//response.Write("{ ""query"":""Li"", ""suggestions"":[""Liberia"",""Libyan Arab Jamahiriya"",""Liechtenstein"",""Lithuania""], ""data"":[""LR"",""LY"",""LI"",""LT""] }")
//response.write("{""reply_code"":1,""reply_text"":""ok""}")
//response.write(" " & request.form("pwd"))


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