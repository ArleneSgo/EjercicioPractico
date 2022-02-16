using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using System.IO;
using System.Data;

namespace VISTA.Pages
{
    public partial class Index : System.Web.UI.Page
    {
        
        public string calificaciones = "[";
        public string alumnos1 = "[";
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void ImportExcel(object sender, EventArgs e)
        {

            var extensionesPermitidas = new String[] { ".xls", ".xlsx" };
            
            if (FileUpload1.HasFile)
            {

                var fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                if (extensionesPermitidas.Contains(fileExtension) == false)
                {
                    lblEstado.Text = "<div class='alert alert-danger'>Solo archivos excel son permitidos</div>";
                }
                else
                {
                    //Save the uploaded Excel file.
                    string filePath = Server.MapPath("~/Include/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(filePath);

                    //Open the Excel file using ClosedXML.
                    using (XLWorkbook workBook = new XLWorkbook(filePath))
                    {
                        //Read the first Sheet from Excel file.
                        IXLWorksheet workSheet = workBook.Worksheet(1);
                        //Create alumns list
                        List<Alumno> alumnos = new List<Alumno> { };

                        //Loop through the Worksheet rows.
                        bool firstRow = true;

                        foreach (IXLRow row in workSheet.Rows())
                        {
                            if (firstRow)
                            {
                                firstRow = false;
                            }
                            else
                            {

                                int i = 0;

                                Alumno alumno = new Alumno();
                                foreach (IXLCell cell in row.Cells())
                                {
                                    switch (i)
                                    {
                                        case 0:
                                            alumno.nombres = cell.Value.ToString();
                                            break;
                                        case 1:
                                            alumno.apMaterno = cell.Value.ToString();
                                            break;
                                        case 2:
                                            alumno.apPaterno = cell.Value.ToString();
                                            break;
                                        case 3:
                                            alumno.fechaNacimiento = DateTime.Parse(cell.Value.ToString());
                                            break;
                                        case 4:
                                            alumno.grado = int.Parse(cell.Value.ToString());
                                            break;
                                        case 5:
                                            alumno.grupo = cell.Value.ToString();
                                            break;
                                        case 6:
                                            alumno.calificacion = float.Parse(cell.Value.ToString());
                                            break;
                                    }

                                    i++;

                                }
                                alumnos.Add(alumno);
                            }

                            gdv.DataSource = alumnos;
                            gdv.DataBind();


                        }
                        CrearGrafica(alumnos);
                        mejorCal.Text += CalcularMejor(alumnos) + " \n";
                        peorCal.Text += CalcularPeor(alumnos) + "\n";
                        promedio.Text += CalcularPromedio(alumnos).ToString() + "\n";

                    }
                }
            }
            else
            {
                lblEstado.Text = "<div class='alert alert-warning'>Primero debe cargar el archivo</div>"; ;
            }
        }
        protected void CrearGrafica(List<Alumno> alumnos)
        {
            foreach (var a in alumnos)
            {
                calificaciones += a.calificacion.ToString() + ",";
                alumnos1 += '"' + a.nombres + '"' + ",";
            }
            calificaciones += "]";
            alumnos1 += "]";
            
        }
        protected string CalcularMejor(List<Alumno> alumnos)
        {
            var calif = 0.0;
            var nomb = "";
            foreach (var a in alumnos)
            {
                if (a.calificacion > calif)
                {
                    nomb = a.nombres + " " + a.apPaterno + " " + a.apMaterno;
                    calif = a.calificacion;
                }
            }
            return nomb;
        }
        protected string CalcularPeor(List<Alumno> alumnos)
        {
            var calif = 10.0;
            var nomb = "";
            foreach (var a in alumnos)
            {
                if (a.calificacion < calif)
                {
                    nomb = a.nombres + " " + a.apPaterno + " " + a.apMaterno;
                    calif = a.calificacion;
                }
            }
            return nomb;
        }
        protected double CalcularPromedio(List<Alumno> alumnos)
        {
            var promedio = 0.0;
            var i = 0;
            foreach(var  a in alumnos)
            {
                promedio += a.calificacion;
                i++;
            }
            return promedio;
        }

        protected void gdv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "Rotar")
            {
                //capturar la fila
                int numFila = ((GridViewRow)((LinkButton)e.CommandSource).Parent.Parent).RowIndex;

                //Buscas el control ubicandolo por fila y columna, y lo agregas a un textbox  
                TextBox txtValor = (gdv.Rows[numFila].Cells[8].FindControl("txtRotar") as TextBox);
                if (txtValor.Text == "")
                {
                    //En caso de que no se ha indicado el numero de veces a rotar
                    gdv.Rows[numFila].Cells[8].FindControl("lblRequerido").Visible = true;
                }
                else
                {
                    //Obtienes el valor del textbox 
                    gdv.Rows[numFila].Cells[8].FindControl("lblRequerido").Visible = false;
                    int rotar = Convert.ToInt32(txtValor.Text);

                    //Obtienes la clave del boundfield
                    string clave = (gdv.Rows[numFila].Cells[7].Text);

                    //convierte la clave en array
                    char[] charArray = clave.ToCharArray();
                    //llama al metodo rotar
                    char[] newArray = Rotar(charArray, rotar);
                    string claveNueva = "" + newArray[0] + newArray[1] + newArray[2] + newArray[3] + newArray[4] + newArray[5];
                    gdv.Rows[numFila].Cells[7].Text = claveNueva;
                    Label1.Text = "El resultado de la clave: " + clave + " al rotar " + rotar + " espacios a la izquierda es " + claveNueva;
                    
                }
            }
        }
        static char[] Rotar(char[] charArray, int rotar)
        {
            char[] output = new char[charArray.Length];

            for (int i = 0; i < charArray.Length; i++)
            {
                output[((i + (rotar * -1)) + charArray.Length) % charArray.Length] = charArray[i];
            }
            return output;
        }
    }
}