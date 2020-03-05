using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Cshop1._1
{
    public class Usuario
    {
       
        AccesoDatos aq = new AccesoDatos();
        int codigo;
        string consulta;
        string nombre;
        string apellido;
        string dni;
        string email;
        string contraseña;
        int tipousuario;
        int estado;

        public string get_nombre() { return nombre; }
        public string get_apellido() { return apellido; }
        public string get_email() { return email; }
        public string get_contraseña() { return contraseña; }
        public string get_dni() { return dni; }
        public int get_codigo() { return codigo; }
        public int get_tiposuario() { return tipousuario; }
        public Usuario() { }
        public Usuario( string email, string contraseña, string nombre = "", string apellido = "", string dni = "", int tipousuario = 1) {
            this.nombre = nombre;
            this.apellido = apellido;
            this.dni = dni;
            this.email = email;
            this.contraseña = contraseña;
            this.tipousuario = tipousuario;


        }

        public int verificarexiste() {
            try
            {
                consulta = "select tipouser from usuarios where email='" + email + "' and contraseña ='" + contraseña + "'";
                DataTable t = aq.ObtenerTabla(consulta);
                if (t.Rows[0][0].ToString() != "")
                {
                    return 1;
                }
            }
            catch (Exception)
            {
                return -1;

            }


            return -1;
           
        }

        public int registrar() {
            try
            {
                consulta = "insert into usuarios select '" + nombre + "','" + apellido + "','" + dni + "','" + email + "','" + contraseña + "'," + tipousuario+",0";
                aq.aplicarconsultasql(consulta);
                return 1;
            }
            catch (Exception ex)
            {
                
                return -1;
                
            }

        }

        public int obtenerdatos() {
            consulta = "select nombre,apellido,dni,tipouser,c_usuario from usuarios where " +
                "email='" + email + "' and contraseña='" + contraseña + "' ";

           DataTable t= aq.ObtenerTabla(consulta);
            if (t.Rows.Count != 0)
            {
                try
                {
                    this.nombre = t.Rows[0][0].ToString();
                    this.apellido = t.Rows[0][1].ToString();
                    this.dni = t.Rows[0][2].ToString();
                    this.tipousuario = int.Parse(t.Rows[0][3].ToString());
                    this.codigo= int.Parse(t.Rows[0]["c_usuario"].ToString());
                    return 1;
                }
                catch (Exception)
                {
                    return -1;
                }
                
            }
            else {
                return -1;
            }


        }

        public static int validaradmin(int tipousuario) {
            try
            {
                if (tipousuario == 0) { return 1; }
                else { return -1; }
            }
            catch (Exception)
            {
                return -1;
            }
           
        }


    }


}