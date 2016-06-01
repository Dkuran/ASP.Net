<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pastel.aspx.cs" Inherits="CakeFactory.Presentacion.Pastel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 295px;
        }
        .style3
        {
            width: 169px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
                                 <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    
                    <h1 style="text-align: center">CAKE FACTORY</h1></td>
                <td>
                    &nbsp;</td>
            </tr>
                                     <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
                                     <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    
                    <h2>Administración de Pasteles</h2></td>
                <td>
                    &nbsp;</td>
            </tr>
                                     <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    
                    <asp:DropDownList ID="drppasteles" runat="server" 
                        ontextchanged="drppasteles_TextChanged">
                    </asp:DropDownList>
                    
                </td>
                <td>
                    <asp:Label ID="lblnombre" runat="server" Font-Size="X-Large" 
                        Text="Descripción: "></asp:Label>
                                         </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Imagen:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:FileUpload ID="flufotopastel" runat="server" />
                </td>
                <td>
                    <asp:Label ID="lblcosto" runat="server" Font-Size="XX-Large" Text="$ 0,00"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Url:"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txturl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txturl" Display="Dynamic" ErrorMessage="Campo Obligatorio">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txturl" Display="Dynamic" ErrorMessage="URL Invalido" 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">URL Invalido</asp:RegularExpressionValidator>
                </td>
                <td class="style3">
                    <asp:Button ID="btnregistrar" runat="server" onclick="btnregistrar_Click" 
                        Text="Registrar" Width="126px" />
                </td>
                <td rowspan="6">
                    <asp:Image ID="imgpastel" runat="server" Height="300px" ImageAlign="Middle" 
                        Width="300px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Costo: "></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtcosto" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvcosto" runat="server" 
                        ControlToValidate="txtcosto" Display="Dynamic" ErrorMessage="Campo Obligatorio">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="txtcosto" Display="Dynamic" 
                        ErrorMessage="Valor entre 1 y 100 dolares" MaximumValue="100" MinimumValue="1" 
                        Type="Double">Valor entre 1 y 100 dolares</asp:RangeValidator>
                </td>
                <td class="style3">
                    <asp:Button ID="btnactualizar" runat="server" onclick="btnactualizar_Click" 
                        Text="Actualizar" Width="126px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Descripcion:"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtdescripcion" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtdescripcion" Display="Dynamic" 
                        ErrorMessage="Contraseña muy debil" 
                        ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">Contraseña muy debil</asp:RegularExpressionValidator>
                </td>
                <td class="style3">
                    <asp:Button ID="btneliminar" runat="server" Text="Eliminar" Width="127px" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2" rowspan="3">
                    
                    <asp:GridView ID="grvpasteles" runat="server" BackColor="#DEBA84" 
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        CellSpacing="2">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    
                </td>
            </tr>
             <tr>
                <td>
                    &nbsp;</td>
            </tr>
                         <tr>
                <td>
                    &nbsp;</td>
            </tr>
                         <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
                         <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
