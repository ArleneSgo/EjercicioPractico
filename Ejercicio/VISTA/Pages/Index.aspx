<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaestra.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="VISTA.Pages.Index" %>
<%@ import Namespace="VISTA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Tables</h1>
        <div id="form1" runat="server">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnImport" runat="server" Text="Importar" OnClick="ImportExcel" />
            <asp:Label ID="lblEstado" runat="server"></asp:Label>
            <hr />
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    Tabla de Alumnos
                </div>
                <div class="card-body">
                    <asp:GridView ID="gdv" CssClass="table table-bordered dataTable" runat="server" AutoGenerateColumns="False" OnRowCommand="gdv_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="nombres" HeaderText="Nombres"></asp:BoundField>
                            <asp:BoundField DataField="apMaterno" HeaderText="Apellido Materno"></asp:BoundField>
                            <asp:BoundField DataField="apPaterno" HeaderText="Apellido Paterno"></asp:BoundField>
                            <asp:BoundField DataField="fechaNacimiento" DataFormatString="{0:d}"  HeaderText="Fecha de Nacimiento"></asp:BoundField>
                            <asp:BoundField DataField="grado" HeaderText="Grado"></asp:BoundField>
                            <asp:BoundField DataField="grupo" HeaderText="Grupo"></asp:BoundField>
                            <asp:BoundField DataField="calificacion" HeaderText="Calificaci&#243;n"></asp:BoundField>
                            <asp:BoundField DataField="clave" HeaderText="Clave"></asp:BoundField>
                            <asp:TemplateField HeaderText="Rotar Clave">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="Número de veces a rotar" ></asp:Label>
                                    <asp:TextBox ID="txtRotar" Type="number" Width="35px" runat="server"></asp:TextBox>
                                    <asp:Label ID="lblRequerido" runat="server" Text="* Campo requerido" ForeColor="Red" Visible="false"></asp:Label>
                                    <asp:LinkButton ID="imgRotar" runat="server" CommandName="Rotar"><i class="fas fa-undo"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                 </div>
            </div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
            <div class="card-body" id="layoutSidenav">
                <div class="row container-fluid">
                   <div class="col-md-6">
                        <asp:Label ID="Label3" runat="server" Text=""> 
                        <div class="card mb-2">
                            <div class="card-header">
                                <i class="fas fa-chart-bar mr-1"></i>
                                Gráfica de Alumnos
                            </div>
                            <canvas id="myBarChart"" width="100%" height="50"></canvas>
                        </div>
                        </asp:Label>
                    </div>
                    <div class="card mb-4 col-md-4">
                        <div class="card-body">
                            <asp:Label ID="mejorCal" runat="server" Text="">Calificación más alta: </asp:Label>
                            <br/>
                            <asp:Label ID="peorCal" runat="server" Text="">Calificación más baja: </asp:Label>
                            <br/>
                            <asp:Label ID="promedio" runat="server" Text="">Promedio: </asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="card-body text-warning">
            <asp:Label  runat="server" >Hermosillo  <i class="fas fa-temperature-high"></i> </asp:Label>
            <div id="lblTemperatura"></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!--ESTA ES DE LA GRAFICA DE BARRAS -->
    <script>
        const calificaciones = <%:calificaciones.ToString()%>
        const alumnos = <%=alumnos1.ToString()%>
    </script>
       
    <!--ESTA ES LA CONEXIÓN CON LA API -->
    <script src="../Include/assets/demo/app.js"></script>  
</asp:Content>
