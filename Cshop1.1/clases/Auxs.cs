using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Cshop1._1.clases
{


    public class sucursal
    {
        private string consulta = "";
        private AccesoDatos aq = new AccesoDatos();
        string nombre;
        string codigo;
        string direccion;
        public sucursal() { }

        public void cargardatos(string nombre, string direccion, string codigo) {
            this.nombre = nombre;
            this.direccion = direccion;
            this.codigo = codigo;

        }
        public  sucursal(string nombre, string direccion,string codigo="0") {

            cargardatos(nombre, direccion, codigo);
        }
        /// <summary>
        /// Cargar los datos en la clase antes de usarse.
        /// 1=todo ok, -1= algo mal :$
        /// </summary>
        /// <returns></returns>
        public int Alta_Sucursal() {

            try
            {
                consulta = "insert into sucursales select '" + nombre + "','" + direccion + "'";
                aq.aplicarconsultasql(consulta);
                return 1;

            }
            catch (Exception ex)
            {
                string e = ex.ToString();
                return -1;
            }
            
        }
        /// <summary>
        /// Cargar los datos en la clase antes de usarse.
        /// devuelve : 1=todo ok, -1= algo mal :$
        /// </summary>
        /// <returns></returns>
        public int update() {
            
            try
            {consulta="update sucursales set nombre='"+nombre+"', direccion='"+direccion+"' where c_sucursal="+codigo;
                aq.aplicarconsultasql(consulta);
                return 1;
            }
            catch (Exception)
            {

                return -1;
            }

        }

        /// <summary>
        /// Carga en una tabla que envien por referencia todos los datos de las sucursales.
        /// devuelve : 1=todo ok
        /// -1: algo mal
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static int all(ref DataTable dt ) {

            try
            {

                AccesoDatos aq = new AccesoDatos();
                dt = aq.ObtenerTabla("select * from sucursales", "tablita");
                return 1;
            }
            catch (Exception)
            {

                return -1;
            }

        }

    }
}