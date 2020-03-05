using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;


    public class tabla_D
    {
       public DataTable t = new DataTable();

        public void Guardartabla(DataTable dt) {
            t = dt;
        }

        public void agregarcampo(string valabuscar, string columna_busc, string camp_agregar, string column_de_agregar)
        {
           
            for (int i = 0; i < t.Rows.Count; i++)
            {
                if (t.Rows[i][columna_busc].ToString() == valabuscar)
                {
                    t.Rows[i][column_de_agregar] = camp_agregar;
                    return;
                }
            }

        }

        public void agregarrow(string nombrecolumna, string valor)
        {
            DataRow dr = t.NewRow();
            dr[nombrecolumna] = valor;
            t.Rows.Add(dr);


        }
        public void agregarcolumna(string nombrecolumna, string tipodedato = "System.String")
        {
            DataColumn columna = new DataColumn(nombrecolumna, System.Type.GetType(tipodedato));
            t.Columns.Add(columna);
        }
        public void sumarval(string val, string columna_abuscar, string column_asumar, int suma)
        {

            for (int i = 0; i < t.Rows.Count; i++)
            {
                if (t.Rows[i][columna_abuscar].ToString() == val)
                {
                    if (t.Rows[i][column_asumar].ToString() == "")
                    {
                        t.Rows[i][column_asumar] = "0";
                        t.Rows[i][column_asumar] = (int.Parse(t.Rows[i][column_asumar].ToString()) + suma).ToString();

                    }
                    else
                    {
                        t.Rows[i][column_asumar] = (int.Parse(t.Rows[i][column_asumar].ToString()) + suma).ToString();
                    }
                }
            }




        }
        public int verificarexistencia(string val, string columna)
        {

            for (int i = 0; i < t.Rows.Count; i++)
            {
                if (t.Rows[i][columna].ToString() == val) { return i; }
            }

            return -1;

        }
    }
