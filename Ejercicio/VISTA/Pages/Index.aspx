<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaestra.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="VISTA.Pages.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Tables</h1>
        <div id="form1" runat="server">
             <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnImport" runat="server" Text="Import" OnClick="ImportExcel" />
            <hr />
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    Tabla de Alumnos
                </div>
                <div class="card-body">
                    <asp:GridView ID="gdv" CssClass="table table-bordered dataTable" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="nombres" HeaderText="Nombres"></asp:BoundField>
                        <asp:BoundField DataField="apMaterno" HeaderText="Apellido Materno"></asp:BoundField>
                        <asp:BoundField DataField="apPaterno" HeaderText="Apellido Paterno"></asp:BoundField>
                        <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha de Nacimiento"></asp:BoundField>
                        <asp:BoundField DataField="grado" HeaderText="Grado"></asp:BoundField>
                        <asp:BoundField DataField="grupo" HeaderText="Grupo"></asp:BoundField>
                        <asp:BoundField DataField="calificacion" HeaderText="Calificaci&#243;n"></asp:BoundField>
                        <asp:BoundField DataField="clave" HeaderText="Clave"></asp:BoundField>
                        
                    </Columns>
                </asp:GridView>
                 </div>
                 </div>
                <div class="card-body" id="layoutSidenav">
                    <div class="container-fluid">
                        <div class="col-lg-6">
                            <div class="card mb-2">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar mr-1"></i>
                                    Gráfica de Alumnos
                                </div>
                                <canvas id="myBarChart"" width="100%" height="50"></canvas>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <asp:Label ID="mejorCal" runat="server" Text="">Calificación más alta: </asp:Label>
                                </br>
                                <asp:Label ID="peorCal" runat="server" Text="">Calificación más baja: </asp:Label>
                                </br>
                                <asp:Label ID="promedio" runat="server" Text="">Promedio: </asp:Label>
                            </div>
                        </div>
                        <div class="">
                            
                        </div>
                    </div>
                </div>
                
            </div>
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!--ESTA ES DE LA GRAFICA DE BARRAS -->
       <script> var calificaciones = <%:calificaciones.ToString()%></script>
       <script> var alumnos = <%=alumnos1.ToString()%></script>
       <script src="/Include/assets/demo/chart-bar-demo.js"></script>        
   
</asp:Content>
