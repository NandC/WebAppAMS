<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebAppAMS.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CarrierName" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="CarrierName" HeaderText="CarrierName" ReadOnly="True" SortExpression="CarrierName" />
                <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" />
                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                <asp:BoundField DataField="PDF" HeaderText="PDF" SortExpression="PDF" />
                <asp:BoundField DataField="Logo" HeaderText="Logo" SortExpression="Logo" />
                <asp:BoundField DataField="Capitas" HeaderText="Capitas" SortExpression="Capitas" />
                <asp:BoundField DataField="FormsLink" HeaderText="FormsLink" SortExpression="FormsLink" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMSConnectionString %>" SelectCommand="SELECT * FROM [Carriers] ORDER BY [CarrierName]"></asp:SqlDataSource>
    </form>
</body>
</html>
