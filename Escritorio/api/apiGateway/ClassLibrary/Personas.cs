using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Personas
    {
        private Conexion conect = new Conexion();
        SqlCommand cmd;

        public int id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string telefono { get; set; }
        public string direccion { get; set; }
        public DateTimeOffset fechaNacimiento { get; set; }
        public string numeroIdentificacaion { get; set; }
        public string tipoIdentificacion { get; set; }
        public string lugarResidencia { get; set; }
        public string rol { get; set; }
        public string clave { get; set; }
        public string correo { get; set; }
        public string estado { get; set; }

/*
        private static List<Personas> listaPersonas;

        public List<Personas> consultaVariasPersonas()
        {
            listaPersonas = new List<Personas>();
            String query = "SELECT * FROM  Personas WHERE estado = @est";
            conect.conectar();
            using (cmd = new SqlCommand(query, conect.connection()))
            {
                cmd.Parameters.Add("@est", SqlDbType.VarChar);
                cmd.Parameters["@est"].Value = "habil";
                try
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Personas lsPersona = new Personas();
                            lsPersona.id = Convert.ToInt32(dr["id"]);
                            lsPersona.nombre = dr["nombre"].ToString();
                            lsPersona.apellido = dr["apellido"].ToString();
                            lsPersona.telefono = dr["telefono"].ToString();
                            lsPersona.direccion = dr["direccion"].ToString();
                            lsPersona.fechaNacimiento = Convert.ToDateTime(dr["fechanacimiento"]);
                            lsPersona.numeroIdentificacaion = dr["numeroidentificacion"].ToString();
                            lsPersona.tipoIdentificacion = dr["tipoidentificacion"].ToString();
                            lsPersona.lugarResidencia = dr["lugarresidencia"].ToString();
                            lsPersona.rol = dr["rol"].ToString();
                            lsPersona.clave = dr["clave"].ToString();
                            lsPersona.correo = dr["correo"].ToString();
                            lsPersona.estado = dr["estado"].ToString();
                           // lsPersona.estado = Convert.ToInt32(dr["estado"]);
                            listaPersonas.Add(lsPersona);
                        }


                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("consulta de persona ha errado.", e);

                }
            }
            return listaPersonas;
        }
        public Personas consultaPersona(int id)
        {
            Personas person;
            String query = "SELECT * FROM  Personas WHERE numeroidentificacion = @id and estado = @est";

            conect.conectar();
            using (cmd = new SqlCommand(query, conect.connection()))
            {
                cmd.Parameters.Add("@numeroidentificacion", SqlDbType.VarChar);
                cmd.Parameters.Add("@est", SqlDbType.VarChar);
                cmd.Parameters["@id"].Value = id;
                cmd.Parameters["@est"].Value = "habil";
                try
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Personas lsPersona = new Personas();
                            lsPersona.id = Convert.ToInt32(dr["id"]);
                            lsPersona.nombre = dr["nombre"].ToString();
                            lsPersona.apellido = dr["apellido"].ToString();
                            lsPersona.telefono = dr["telefono"].ToString();
                            lsPersona.direccion = dr["direccion"].ToString();
                            lsPersona.fechaNacimiento = Convert.ToDateTime(dr["fechanacimiento"]);
                            lsPersona.numeroIdentificacaion = dr["numeroidentificacion"].ToString();
                            lsPersona.tipoIdentificacion = dr["tipoidentificacion"].ToString();
                            lsPersona.lugarResidencia = dr["lugarresidencia"].ToString();
                            lsPersona.rol = dr["rol"].ToString();
                            lsPersona.clave = dr["clave"].ToString();
                            lsPersona.correo = dr["correo"].ToString();
                            lsPersona.estado = dr["estado"].ToString();
                            return lsPersona;
                        }
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("consulta de personas ha errado.", e);
                }
            }
            return null;
        }
        public bool registrarPersona(Personas personas)
        {
            bool result = false;
            String query = "INSERT INTO Personas (id, nombre, apellido, telefono, direccion, numeroidentificacion, tipoidentificacion, lugarresidencia, rol, clave, correo, estado) VALUES (@id, @nombre, @apellidos, @telefono, @direccion, @numeroidentificacion, @tipoidentificacion, @lugarresidencia, @rol, @clave, @correo, @estado);";

            conect.conectar();
            using (cmd = new SqlCommand(query, conect.connection()))
            {
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                cmd.Parameters.Add("@apellido", SqlDbType.VarChar);
                cmd.Parameters.Add("@telefono", SqlDbType.VarChar);
                cmd.Parameters.Add("@direccion", SqlDbType.VarChar);
                cmd.Parameters.Add("@numeroidentificacion", SqlDbType.VarChar);
                cmd.Parameters.Add("@tipoidentificacion", SqlDbType.VarChar);
                cmd.Parameters.Add("@lugarresidencia", SqlDbType.VarChar);
                cmd.Parameters.Add("@rol", SqlDbType.VarChar);
                cmd.Parameters.Add("@clave", SqlDbType.VarChar);
                cmd.Parameters.Add("@correo", SqlDbType.VarChar);
                cmd.Parameters.Add("@estado", SqlDbType.VarChar);

                cmd.Parameters["@id"].Value = personas.id;
                cmd.Parameters["@nombre"].Value = personas.nombre;
                cmd.Parameters["@apellido"].Value = personas.apellido;
                cmd.Parameters["@telefono"].Value = personas.telefono;
                cmd.Parameters["@direccion"].Value = personas.direccion;
                cmd.Parameters["@numeroidentificacion"].Value = personas.numeroIdentificacaion;
                cmd.Parameters["@tipoidentificacion"].Value = personas.tipoIdentificacion;
                cmd.Parameters["@lugarresidencia"].Value = personas.lugarResidencia;
                cmd.Parameters["@rol"].Value = personas.rol;
                cmd.Parameters["@clave"].Value = personas.clave;
                cmd.Parameters["@correo"].Value = personas.correo;
                cmd.Parameters["@estado"].Value = "habil";
                try
                {
                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        result = true;
                    }
                    else { result = false; }
                }
                catch (Exception e)
                {
                    Console.WriteLine("insersion de persona ha errado.", e);
                    result = false;
                }
            }
            return result;
        }

        public bool eliminar(int id)
        {
            bool result;
            String query = "DELETE Personas WHERE numeroidentificacion = @id and estado = @est";

            conect.conectar();
            using (cmd = new SqlCommand(query, conect.connection()))
            {

                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = id;
                cmd.Parameters.Add("@est", SqlDbType.VarChar);
                cmd.Parameters["@est"].Value = "habilitado";
                try
                {
                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        result = true;
                    }
                    else { result = false; }
                }
                catch (Exception e)
                {
                    Console.WriteLine("eliminacion de persona se ha errado.", e);
                    result = false;
                }
            }
            return result;
        }
        public bool actualizar(Personas personas)
        {
            bool result;
            String query = "UPDATE Personas SET estado = @est WHERE numeroidentificacion = @id";

            conect.conectar();
            using (cmd = new SqlCommand(query, conect.connection()))
            {

                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
                cmd.Parameters.Add("@apellido", SqlDbType.VarChar);
                cmd.Parameters.Add("@telefono", SqlDbType.VarChar);
                cmd.Parameters.Add("@direccion", SqlDbType.VarChar);
                cmd.Parameters.Add("@numeroidentificacion", SqlDbType.VarChar);
                cmd.Parameters.Add("@tipoidentificacion", SqlDbType.VarChar);
                cmd.Parameters.Add("@lugarresidencia", SqlDbType.VarChar);
                cmd.Parameters.Add("@rol", SqlDbType.VarChar);
                cmd.Parameters.Add("@clave", SqlDbType.VarChar);
                cmd.Parameters.Add("@correo", SqlDbType.VarChar);
                cmd.Parameters.Add("@estado", SqlDbType.VarChar);

                cmd.Parameters["@id"].Value = personas.id;
                cmd.Parameters["@nombre"].Value = personas.nombre;
                cmd.Parameters["@apellido"].Value = personas.apellido;
                cmd.Parameters["@telefono"].Value = personas.telefono;
                cmd.Parameters["@direccion"].Value = personas.direccion;
                cmd.Parameters["@numeroidentificacion"].Value = personas.numeroIdentificacaion;
                cmd.Parameters["@tipoidentificacion"].Value = personas.tipoIdentificacion;
                cmd.Parameters["@lugarresidencia"].Value = personas.lugarResidencia;
                cmd.Parameters["@rol"].Value = personas.rol;
                cmd.Parameters["@clave"].Value = personas.clave;
                cmd.Parameters["@correo"].Value = personas.correo;
                cmd.Parameters["@estado"].Value = "habil";
                try
                {
                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        result = true;
                    }
                    else { result = false; }
                }
                catch (Exception e)
                {
                    Console.WriteLine("modificacion de estudiante se ha errado.", e);
                    result = false;
                }
            }
            return result;
        }*/
    }
}

