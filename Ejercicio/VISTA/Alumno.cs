using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VISTA
{
    public class Alumno
    {
        public string nombres { get; set; }
        public string apMaterno { get; set; }
        public string apPaterno { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public int grado { get; set; }
        public string grupo { get; set; }
        public float calificacion { get; set; }
        //public int edad { get ; set ; }
        
        public Alumno(){}
        public int edad
        {

            get
            {
                DateTime now = DateTime.Today;
                int edad = DateTime.Today.Year - fechaNacimiento.Year;

                if (DateTime.Today < fechaNacimiento.AddYears(edad))
                    return --edad;
                else
                    return edad;
            }

            set { edad = value; }
        }
        public string clave
        {
            get
            {
                var cl = nombres[0].ToString().ToUpper();
                cl += nombres[1].ToString().ToUpper();
                cl += apMaterno[apMaterno.Length - 2].ToString().ToUpper();
                cl += apMaterno[apMaterno.Length - 1].ToString().ToUpper();
                //var cl = "A";
                var clave = "";
                string abc = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
                for(int i=0; i < cl.Length; i++)
                {
                    if (cl[i] == 'A')clave += abc[abc.Length - 3];
                    
                    else if (cl[i] == 'B')clave += abc[abc.Length - 2];
                    else if (cl[i] == 'C') clave += abc[abc.Length - 1];
                    else
                    {
                        for(int j = 0; j < abc.Length; j++)
                        {
                            if (cl[i] == abc[j])
                            {
                                clave += abc[j - 3];
                            }
                        }
                    }
                }

                clave += edad.ToString();
                return clave;
            }
            set{ clave=value; }
        }
    }
}
