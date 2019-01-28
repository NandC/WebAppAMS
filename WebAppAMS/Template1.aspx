<%@ Page Language="VB" %>

<%@ Register Src="~/Header1.ascx" TagPrefix="uc1" TagName="Header1" %>
<%@ Register Src="~/Footer1.ascx" TagPrefix="uc1" TagName="Footer1" %>

<!DOCTYPE html>

<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        'If Not Session("WSLoggedIn") = "Y" Then
        '    Session("PageToLaunch") = System.IO.Path.GetFileName(Request.Url.ToString())
        '    Response.Redirect("Login.aspx")
        'End If

        Dim conn As System.Data.SqlClient.SqlConnection, sl As String, good As String
        Dim comm As System.Data.SqlClient.SqlCommand
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("AMSConnectionString").ConnectionString
        conn = New System.Data.SqlClient.SqlConnection(connectionString)
        conn.Open()
        sl = "SELECT * FROM WSLogins"
        comm = New System.Data.SqlClient.SqlCommand(sl, conn)
        reader = comm.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            good = "N"
        Else
            good = "Y"
        End If
        reader.Close()
        conn.Close()
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="http://amsfsg-framework.gatorworks.site/assets/css/app.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link href="/assets/fontawesome-pro-5.2.0-web/css/all.css" rel="stylesheet" />
    <script src="http://amsfsg-framework.gatorworks.site/assets/js/Chart.bundle.min.js"></script>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AMS/FSG - Company Intranet</title>
</head>
<body class="color-profile-copper" data-color-profile="copper">
    <uc1:Header1 runat="server" ID="Header1" />
    <section class="page-content">
    <div class="grid-container"><div class="grid-x grid-padding-x align-center"><div class="cell large-10">
    <h4 class="text-left">Page Header</h4>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CarrierName" DataSourceID="SqlDataSource1" Width="800px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="CarrierName" HeaderText="CarrierName" ReadOnly="True" SortExpression="CarrierName" />
                    <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" />
                    <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                    <asp:BoundField DataField="PDF" HeaderText="PDF" SortExpression="PDF" />
                    <asp:BoundField DataField="Logo" HeaderText="Logo" SortExpression="Logo" />
                    <asp:BoundField DataField="Capitas" HeaderText="Capitas" SortExpression="Capitas" />
                    <asp:BoundField DataField="FormsLink" HeaderText="FormsLink" SortExpression="FormsLink" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMSConnectionString %>" SelectCommand="SELECT * FROM [Carriers] ORDER BY [CarrierName]"></asp:SqlDataSource>
            <br />
        </div>
    </form>
    </div></div></div>
    </section>
    <uc1:Footer1 runat="server" ID="Footer1" />
    <script src="http://amsfsg-framework.gatorworks.site/assets/js/app.js"></script>
</body>
</html>
