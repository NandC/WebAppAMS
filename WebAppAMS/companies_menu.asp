<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <script language='JavaScript' type='text/JavaScript'>
<!--
    function PostForm() {
        var x = document.getElementById("Form1");
        x.action = "companies_menu.asp";
        x.method = "post";
        x.target = "_self";
        x.submit();
    }
    //-->
</script>
<head>
<meta content="en-us" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

<link href="ws.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.style3 {
	border: 1px solid #808080;
	background-color: #F0F0F0;
}
.style1 {
	border: 1px solid #808080;
}
.style4 {
	font-size: x-small;
}
.style5 {
	border: 1px solid #808080;
	text-decoration: underline;
}
.style6 {
	border: 1px solid #808080;
	background-color: #F0F0F0;
	text-decoration: underline;
}
</style>
</head>

<body>
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "AMS"
set rsC = Server.CreateObject("ADODB.Recordset")
set rsC.ActiveConnection = conn
rsC.Source = "SELECT * FROM tblCompanies WHERE ShowOnIntranet<>0 ORDER BY CompanyName"
rsC.Open
c=request("Comp")

set rsComp = Server.CreateObject("ADODB.Recordset")
set rsComp.ActiveConnection = conn
rsComp.Source = "SELECT * FROM vwCompAll ORDER BY CompanyName,PlanName"
rsComp.Open
cprod=request("cprod")

If cprod<>"" Then
	set rsCProd = Server.CreateObject("ADODB.Recordset")
	set rsCProd.ActiveConnection = conn
	rsCProd.Source = "SELECT * FROM vwCompAll WHERE PlanName='" & cprod & "'"
	rsCProd.Open
end if


If c<>"" then
	set rsD = Server.CreateObject("ADODB.Recordset")
	set rsD.ActiveConnection = conn
	rsD.Source = "SELECT * FROM tblCompanies WHERE CompanyID=" & c
	rsD.Open

	
	set rsIR= Server.CreateObject("ADODB.Recordset")
	set rsIR.ActiveConnection = conn
	
	rsIR.Source = "SELECT * FROM InterestRates WHERE CompanyID=" & c
	rsIR.Open

	set rsCA= Server.CreateObject("ADODB.Recordset")
	set rsCA.ActiveConnection = conn
	
	rsCA.Source = "SELECT * FROM Carriers WHERE CompanyID=" & c
	rsCA.Open

	
	set rsCompAll = Server.CreateObject("ADODB.Recordset")
	set rsCompAll.ActiveConnection = conn
	sl= "SELECT DISTINCT 'I' as ptype,CompanyName,PlanName FROM vwIndexedAll "
	sl=sl & " WHERE CompanyName='" & rsD("CompanyName") & "' "
	sl=sl & " UNION "
	sl=sl & " SELECT DISTINCT 'F' as ptype,CompanyName,PlanName FROM vwFixedAll "
	sl=sl & " WHERE CompanyName='" & rsD("CompanyName") & "' "
	sl=sl & " ORDER BY CompanyName,PlanName"
	rsCompAll.Source = sl
	rsCompAll.Open

end if
%>


<p></p>

<%If 1=2 then%>
<p style="font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: small">
<strong><a href="../iframe_interest_rates.asp" target="_blank">INTEREST RATES</a></strong></p>
<% End If%>
<form  name="Form1" id="Form1"  method="post" action="companies_menu.asp">


<p style="font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: small">
SELECT A COMPANY:<br />
<select name="Comp"  onchange="PostForm();">
<option></option>
<%do until rsC.eof%>
<option <%if clng(rsC("CompanyID"))=clng(c) then response.write "selected"%> value="<%=rsC("CompanyID")%>"><%=rsC("CompanyName")%></option>
<%rsC.movenext
loop%>
</select>&nbsp; <input name="Submit1" type="submit" value="View" /><br />
&nbsp;</p>

</form>

<%If request("comp")<>"" Then%>
<form name="Form2" id="Form2" action="prodlink.asp" target="_blank" method="post" >
	<table  style="width: 1000px">
		
		<tr>
			<td style="width: 90px; font-family: Verdana, Geneva, Tahoma, sans-serif;">Products:</td>
			<td style="width: 800px">
			<select name="cprod">
<option></option>
<%do until rsCompAll.eof%>
<option value="<%=rsCompAll("PlanName")%>"><%=rsCompAll("Ptype") & ": " & rsCompAll("CompanyName") & "/" & rsCompAll("PlanName")%></option>
<%rsCompAll.movenext
loop%>
</select><input name="Submit2" type="submit" value="View" /></td>
		</tr>
		</table>
</form>
<%End If%>
<%If c<>"" then%>

<%
Function MakeVCF

	' Name for the ouput document 
	file_being_created= "vcf/" & rsD("CompanyID") & ".vcf"
	
	' create a file system object
	set fso = createobject("scripting.filesystemobject")
	
	' create the text file - true will overwrite any previous files
	' Writes the db output to a .xls file in the same directory
	Set act = fso.CreateTextFile(server.mappath(file_being_created), true)
	
	' All non repetitive html on top goes here
	
	act.WriteLine("BEGIN:VCARD")
	
    act.WriteLine("VERSION:2.1")
    'act.WriteLine("N:" & rsA.Fields("agt_last_name").Value & ";" & rsA.Fields("agt_first_name").Value)
    'act.WriteLine("FN:" & rsA.Fields("agt_first_name").Value & " " & rsA.Fields("agt_last_name").Value)
    act.WriteLine("ORG:" & rsD.Fields("CompanyName").Value)
    'act.WriteLine("TITLE:" & rsA.Fields("agt_Title").Value)
    act.WriteLine("TEL;WORK;VOICE:" & rsD.Fields("CompanyPhone").Value)
    'If not isnull(rsD("contact1")) then act.WriteLine("TEL;" & rsD("contact1") & ";VOICE:" & rsD("contactphone1"))
    'If not isnull(rsD("contact2")) then act.WriteLine("TEL;" & rsD("contact2") & ";VOICE:" & rsD("contactphone2"))
    'If not isnull(rsD("contact3")) then act.WriteLine("TEL;" & rsD("contact3") & ";VOICE:" & rsD("contactphone3"))
    'If not isnull(rsD("contact4")) then act.WriteLine("TEL;" & rsD("contact4") & ";VOICE:" & rsD("contactphone4"))
    'If not isnull(rsD("contact5")) then act.WriteLine("TEL;" & rsD("contact5") & ";VOICE:" & rsD("contactphone5"))
    'If not isnull(rsD("contact6")) then act.WriteLine("TEL;" & rsD("contact6") & ";VOICE:" & rsD("contactphone6"))
    'If not isnull(rsD("contact7")) then act.WriteLine("TEL;" & rsD("contact7") & ";VOICE:" & rsD("contactphone7"))
    'If not isnull(rsD("contact8")) then act.WriteLine("TEL;" & rsD("contact8") & ";VOICE:" & rsD("contactphone8"))
    'If not isnull(rsD("contact9")) then act.WriteLine("TEL;" & rsD("contact9") & ";VOICE:" & rsD("contactphone9"))
	notes=""
    If not isnull(rsD("contact1")) then notes=notes & rsD("contact1") & ": " & rsD("contactphone1") & "    "
    If not isnull(rsD("contact2")) then notes=notes & rsD("contact2") & ": " & rsD("contactphone2") & "    "
    If not isnull(rsD("contact3")) then notes=notes & rsD("contact3") & ": " & rsD("contactphone3") & "    "
    If not isnull(rsD("contact4")) then notes=notes & rsD("contact4") & ": " & rsD("contactphone4") & "    "
    If not isnull(rsD("contact5")) then notes=notes & rsD("contact5") & ": " & rsD("contactphone5") & "    "
    If not isnull(rsD("contact6")) then notes=notes & rsD("contact6") & ": " & rsD("contactphone6") & "    "
    If not isnull(rsD("contact7")) then notes=notes & rsD("contact7") & ": " & rsD("contactphone7") & "    "
    If not isnull(rsD("contact8")) then notes=notes & rsD("contact8") & ": " & rsD("contactphone8") & "    "
    If not isnull(rsD("contact9")) then notes=notes & rsD("contact9") & ": " & rsD("contactphone9") & "    "
    act.WriteLine("NOTE:" & notes)
    'act.WriteLine("TEL;WORK;FAX:" & rsA.Fields("agt_fax_phone").Value)
    'act.WriteLine("TEL;HOME;VOICE:" & rsA.Fields("agt_home_phone").Value)
    'act.WriteLine("TEL;CELL:" & rsA.Fields("agt_cell_phone").Value)
    'act.WriteLine("EMAIL;WORK:" & rsA.Fields("agt_email_addr").Value)
    act.WriteLine("ADR;WORK:;;" & rsD.Fields("CompanyAddress").Value & ";" & rsD.Fields("CompanyCity").Value & ";" & rsD.Fields("CompanyState").Value & ";" & rsD.Fields("CompanyZip").Value & ";USA")
    act.WriteLine("END:VCARD")

	
	' close the object (excel)
	act.close

End Function

MakeVCF

%>

<p class="StyleBasic">Details for Company: <b><%=rsD("Companyname")%></b></p>

<table cellpadding="0" cellspacing="0" class="newStyle1" style="width: 1000px">
	<tr>
		<td class="style3" style="width: 150px">Website</td>
		<td class="style1" style="width: 350px"> <b><a target="_blank" href="http://<%=rsD("CompanyWebsite")%>"><%=rsD("CompanyWebsite")%></a></b></td>
		<td class="style6" style="width: 150px">Phone Number</td>
		<td class="style5" style="width: 350px"> Department</td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px"> &nbsp;</td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone1")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact1")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">Address</td>
		<td class="style1" style="width: 350px"> <b><%=rsD("CompanyAddress")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
		<a href="vcf/<%=rsD("CompanyID")%>.vcf">
		<img height="14" src="vcard_icon.gif" style="border-width: 0px" width="16" /></a>
		<span class="style4">(Outlook V-Card)</span></td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone2")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact2")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">City</td>
		<td class="style1" style="width: 350px"> <b><%=rsD("CompanyCity")%></b></td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone3")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact3")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">State</td>
		<td class="style1" style="width: 350px"> <b><%=rsD("CompanyState")%> </b></td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone4")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact4")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">Zip Code</td>
		<td class="style1" style="width: 350px"> <b><%=rsD("CompanyZip")%></b></td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone5")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact5")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px"> 
		<a href='http://maps.google.com/maps?f=q&amp;hl=en&amp;q=<%=rsD("CompanyAddress") & "," & rsD("CompanyZip") %>' target="_blank">map</a></td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone6")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact6")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px"> &nbsp;</td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone7")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact7")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px"> <%If rsD("CompanyID")=4 Then%>
		<a href="https://www.annuitymarketing.com/Graphics/sales_tools/AMS/Voya_RVP_Map.pdf" target="_blank">Voya RVP Map</a><%End If%></td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone8")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact8")%></b></td>
	</tr>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		&nbsp;</td>
		<td class="style3" style="width: 150px"> <b><%=rsD("contactphone9")%></b></td>
		<td class="style1" style="width: 350px"> <b><%=rsD("contact9")%></b></td>
	</tr>
<%If not rsIR.eof then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<%If not isnull(rsIR("RateChange")) and rsIR("RateChange")<>"NA" Then%>
		<a href='<%If NOT(c=101 or c=146) Then %>https://www.annuitymarketing.com/Graphics/interest_rates/<%End If %><%=rsIR("RateChange")%>' target="_blank">Interest Rate Changes</a>
        <%End if%>
		</td>
		<td class="style3" colspan="2"><%=rsIR("RateChangeDesc")%></td>
	</tr>
	<%If not isnull(rsIR("RateChange2")) Then
        response.write c %>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='<%If NOT(c=101 or c=146 or c=147) Then %>https://www.annuitymarketing.com/Graphics/interest_rates/<%End If %><%=rsIR("RateChange2")%>' target="_blank">Interest Rate Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChange2Desc")%></td>
	</tr>
	<%End If%>
	<%If not isnull(rsIR("RateChange3")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChange3")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChange3Desc")%></td>
	</tr>
	<%End If%>

	<%If not isnull(rsIR("RateChange4")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChange4")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChange4Desc")%></td>
	</tr>
	<%End If%>
	<%If not isnull(rsIR("RateChange5")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChange5")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChange5Desc")%></td>
	</tr>
	<%End If%>
	<%If not isnull(rsIR("RateChange6")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChange6")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChange6Desc")%></td>
	</tr>
	<%End If%>

	<%If not isnull(rsIR("RateChangePPLS"))  Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChangePPLS")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChangePPLSDesc")%></td>
	</tr>
	<%End If%>
	<%If not isnull(rsIR("RateChangeBANK")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChangeBANK")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChangeBANKDesc")%></td>
	</tr>
	<%End If%>
	<%If not isnull(rsIR("RateChangeRJ")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChangeRJ")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChangeRJDesc")%></td>
	</tr>
	<%End If%>
	<%If not isnull(rsIR("RateChangeCOMERICA")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChangeCOMERICA")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChangeCOMERICADesc")%></td>
	</tr>
	<%End If%>

	<%If not isnull(rsIR("RateChangeCAP1")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChangeCAP1")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChangeCAP1Desc")%></td>
	</tr>
	<%End If%>

	<%If not isnull(rsIR("RateChangeHISI")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("RateChangeHISI")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("RateChangeHISIDesc")%></td>
	</tr>
	<%End If%>

	<%If not isnull(rsIR("ClientApproved1")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("ClientApproved1")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("ClientApproved1Desc")%></td>
	</tr>
	<%End If%>

	<%If not isnull(rsIR("ClientApproved2")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("ClientApproved2")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("ClientApproved2Desc")%></td>
	</tr>
	<%End If%>
	<%If not isnull(rsIR("ClientApproved3")) Then%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href='https://www.annuitymarketing.com/Graphics/interest_rates/<%=rsIR("ClientApproved3")%>' target="_blank">Interest Rate 
		Changes</a></td>
		<td class="style3" colspan="2"><%=rsIR("ClientApproved3Desc")%></td>
	</tr>
	<%End If%>

	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<%If not isnull(rsIR("RateHistory")) and rsIR("RateHistory")<>"NA" Then%>
		<a href='https://www.annuitymarketing.com/Graphics/rate_history/<%=rsIR("RateHistory")%>' target="_blank">Renewal Rate 
		History</a><%End if%></td>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px"> &nbsp;</td>
	</tr>
<%End If%>
	<tr>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px">
		<a href="https://www.annuitymarketing.com/Graphics/ratings/<%=rsCA.Fields("PDF")%>" target="_blank" class="body_14_bold_center"><%=rsCA.Fields("CarrierName")%> Rating</a>
		</td>
		<td class="style3" style="width: 150px">&nbsp;</td>
		<td class="style1" style="width: 350px"> &nbsp;</td>
	</tr>
	</table>

<p><%If not rsIR.eof then%><img src='https://www.annuitymarketing.com/Graphics/contracts/logos/<%=rsIR("Logo")%>' /><%End If%></p>
<p> </p>



<%End If%>
<br/>

<%If cprod<>"" Then%>
<p>&nbsp;<table cellpadding="0" cellspacing="0" style="width: 1000px" class="newStyle1">
	<tr class="style3">
		<td class="style3" colspan="5"><strong>Competitors Product Details&nbsp;</strong></td>
	</tr>

	<tr class="style3">
		<td class="style3"><strong>Company</strong></td>
		<td class="style3"><strong>Plan Name</strong></td>
		<td class="style3"><strong>Term</strong></td>
		<td class="style3"><strong>Strategies/Rates</strong></td>
		<td class="style3"><strong>Commission</strong></td>
	</tr>

	<tr>
		<td valign="top" class="style1"><%=rsCProd("CompanyName")%>&nbsp;</td>
		<td valign="top" class="style1"><strong><%=rsCProd("PlanName")%></strong>&nbsp;</td>
		<td valign="top" class="style1"><%=rsCProd("col4f")%>&nbsp;</td>
		<td valign="top" class="style1"><%=rsCProd("col1f")%>&nbsp;</td>
		<td valign="top" class="style1"><%=rsCProd("col8f")%>&nbsp;</td>
	</tr>
</table>
</p>
<%End If%>

</body>

</html>
