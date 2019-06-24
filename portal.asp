<body>
<%
key_login = request.form("key")
payload = request.form("payload")


//response.write(key_login)
//response.write("<br>")

//get key_app from DB
key_app = "C887AJ7E-698F-4A15-BD35-2F583441258D"


//payload = "{ TotalAmount: 1, CurrencyCode: 1, TransactionId: 36985223, Business: { ApiKey: '" & key & "',Description: '' }, CreditTypes: [ {CreditTypeCode: 1, MaxNumberOfPayments: 1}] }"


if key_login <> key_app then
    response.write "Not Alloewd"
else 
	response.write "Yes Alloewd"
	
	//POST intra service
	
	//url = "https://10.7.14.xx"
	//Dim oXMLHttp
	//Set oXMLHttp=Server.Createobject("MSXML2.ServerXMLHTTP.6.0")
	//oXMLHttp.open "POST", url,false
	//oXMLHttp.setRequestHeader "Content-Type", "application/json"
	//oXMLHttp.send payload
	//response.write oXMLHttp.responseText
	//Set oXMLHttp = Nothing

end if

%>
</body>