<body>

<%
key_login = request.form("key")
payload = request.form("payload")
app_id_req = request.form("app_id")


//response.write(key_login)
//response.write("<br>")

//get key_app from DB

dim con
set con=Server.CreateObject("ADODB.Connection")
con.open "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=WebMed_User;Password=Warm104Pro;Initial Catalog=WebMed;Data Source=10.7.2.129"

If con.errors.count <> 0 Then   
 
   Response.Write "Error Connect Database "
   response.write("<br>")
else
      //Response.Write "Connected OK"
	 // response.write("<br>")

 
		 sql = " SELECT * FROM app_access  WHERE app_id = " & app_id_req & " " 
		 // response.write(sql)
		  //response.write("<br>")
		Set rec = con.Execute(sql)

		If Not rec.EOF Then 
			//Response.write(rec.fields("app_name").value)
			//Response.write(rec.fields("app_key").value)
			//response.write("<br>")
			
				
				
				//update app_count
					count_access = rec.fields("app_count").value +1 
					
					 response.write("Count Access=" & count_access)
					 response.write("<br>")
					
					sqlup = "UPDATE app_access SET app_count = '" & count_access & "' WHERE app_id = " & app_id_req & " " 
					//Response.write(sqlup)
					//response.write("<br>")
					
					Set recup = con.Execute(sqlup)
					if err<>0 then
						response.write("Error update permissions!")
					end if
				
				if key_login <> rec.fields("app_key").value then
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
		Else 
			Response.Write("<script>alert('++Not Found application ++');window.history.back();</script>")
		End If 

	


		//payload = "{ TotalAmount: 1, CurrencyCode: 1, TransactionId: 36985223, Business: { ApiKey: '" & key & "',Description: '' }, CreditTypes: [ {CreditTypeCode: 1, MaxNumberOfPayments: 1}] }"

		 
	
End If
%>
</body>