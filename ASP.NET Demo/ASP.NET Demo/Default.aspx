<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP.NET_Demo.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        // A $( document ).ready() block.
        var changedRows = [];
        $(document).ready(function () {
            alert('document is ready');
            var rowChanged = function (data) {
                alert(data);
            };
        });

        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Editable Grid DEMO</h2>
        <asp:HiddenField ID="hdnProductRowChanged" Value="" />
         <asp:GridView ID="grdProduct" Runat="server" 
             DataKeyNames="ID"
            AutoGenerateColumns="False" 
            BorderWidth="1px" BackColor="White"
            CellPadding="4" BorderStyle="None" BorderColor="#3366CC">
            <FooterStyle ForeColor="#003399" 
               BackColor="#99CCCC"></FooterStyle>
            <PagerStyle ForeColor="#003399" HorizontalAlign="Left" 
               BackColor="#99CCCC"></PagerStyle>
            <HeaderStyle ForeColor="#CCCCFF" Font-Bold="True" 
               BackColor="#003399"></HeaderStyle>
            <Columns>
                <asp:BoundField ReadOnly="True" HeaderText="ProductID" 
                    InsertVisible="False" DataField="ID"
                    SortExpression="ID"></asp:BoundField>
                <asp:BoundField HeaderText="Product" 
                    DataField="Name" 
                    SortExpression="Name"></asp:BoundField>
                <asp:BoundField HeaderText="Price" 
                    DataField="Price" SortExpression="Price">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>

                <asp:TemplateField HeaderText="Edit Price" SortExpression="Price">
                <ItemTemplate>
                    <!--OnTextChanged="TextBox_TextChanged"-->
                <asp:TextBox ID="txtEditPrice"  onchange="rowChanged('<%# Container.DataItemIndex %>')" runat="server" Text='<%# Bind("Price") %>' Visible='<%#Convert.ToBoolean(Eval("IsEditable")) %>'
                 BorderStyle="None"></asp:TextBox>
                </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
            <SelectedRowStyle ForeColor="#CCFF99" Font-Bold="True" 
                BackColor="#009999"></SelectedRowStyle>
            <RowStyle ForeColor="#003399" BackColor="White"></RowStyle>
        </asp:GridView>
        <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
    </div>
    </form>
</body>
</html>
