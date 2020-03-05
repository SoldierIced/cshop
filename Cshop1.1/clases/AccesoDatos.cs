using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de AccesoDatos
/// </summary>
public class AccesoDatos
{
    public String rutaBDLibreria =
    "Data Source=localhost\\sqlexpress;Initial Catalog=cshop;Integrated Security=True";

    public AccesoDatos()
	{
		// TODO: Agregar aquí la lógica del constructor
	}
    public DataTable ObtenerTabla(String Sql, string tabla = "tabla")
    {
        DataSet ds = new DataSet();
        SqlDataAdapter adaptador;
        SqlConnection cn = new SqlConnection(rutaBDLibreria);
        cn.Open();
        adaptador = new SqlDataAdapter(Sql, cn);
        adaptador.Fill(ds, tabla);
        cn.Close();
        return ds.Tables[tabla];
    }
    public static DataTable ObtenerTabla2(String Sql, string tabla = "tabla",string aux="")
    {
        DataSet ds = new DataSet();
        SqlDataAdapter adaptador;
        AccesoDatos aq = new AccesoDatos();
        SqlConnection cn = new SqlConnection(aq.rutaBDLibreria);
        cn.Open();
        adaptador = new SqlDataAdapter(Sql, cn);
        adaptador.Fill(ds, tabla);
        cn.Close();
        return ds.Tables[tabla];
    }
    private SqlConnection ObtenerConexion()
    {
        SqlConnection cn = new SqlConnection(rutaBDLibreria);
        try
        {
            cn.Open();
            return cn;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    private SqlDataAdapter ObtenerAdaptador(String consultaSql)
    {
        SqlDataAdapter adaptador;
        try
        {
            adaptador=new SqlDataAdapter(consultaSql,ObtenerConexion());
            return adaptador;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public void aplicarconsultasql(String Sql,string tabla= "tabla")
    {
        DataSet ds = new DataSet();
        SqlDataAdapter adaptador;
        SqlConnection cn = new SqlConnection(rutaBDLibreria);
        cn.Open();
        adaptador = new SqlDataAdapter(Sql, cn);
        adaptador.Fill(ds, tabla);
        cn.Close();
    }
    public static void aplicarconsultasql2(String Sql)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter adaptador;
        AccesoDatos aq = new AccesoDatos();
        SqlConnection cn = new SqlConnection(aq.rutaBDLibreria);
        cn.Open();
        adaptador = new SqlDataAdapter(Sql, cn);
        adaptador.Fill(ds, "tablita");
        cn.Close();
    }
    public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP) //comando que recibe tiene los parametros incluidos
    {
        int FilasCambiadas;
        SqlConnection Conexion = ObtenerConexion();
        SqlCommand cmd = new SqlCommand();
        cmd = Comando;
        cmd.Connection = Conexion;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = NombreSP;
        FilasCambiadas = cmd.ExecuteNonQuery();
        Conexion.Close();
        return FilasCambiadas;
    }


}