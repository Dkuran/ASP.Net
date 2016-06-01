using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.Common;
using System.Data;
using CakeFactory.Comun;

namespace CakeFactory.Datos
{
    public class Dt_ClsPastel
    {
        public Dt_ClsPastel() { 
        
        }

        public static string constr {
            get { return ConfigurationManager.ConnectionStrings["Conn"].ConnectionString; }
        }

        public static string provider {
            get { return ConfigurationManager.ConnectionStrings["Conn"].ProviderName; }
        }

        public static DbProviderFactory dpf {
            get {
                return DbProviderFactories.GetFactory(provider);
            }
        }

        private static int ejecuteNonQuery(string StoredProcedure, List<DbParameter> parametros) {
            int id = 0;
            try
            {
                using (DbConnection con = dpf.CreateConnection()) {
                    con.ConnectionString = constr;
                    using(DbCommand cmd = dpf.CreateCommand()){
                        cmd.Connection = con;
                        cmd.CommandText = StoredProcedure;
                        cmd.CommandType = CommandType.StoredProcedure;

                        foreach (DbParameter param in parametros) {
                            cmd.Parameters.Add(param);
                        }
                        con.Open();
                        id = cmd.ExecuteNonQuery();

                    }
                }
            }
            catch (Exception ex){
                throw;
            }
            return id;
        }

        public int insertarPastel(string url, decimal costo, string descripcion, Byte[] byteImage)
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param = dpf.CreateParameter();
            param.Value = url;
            param.ParameterName = "url_pas";
            parametros.Add(param);

            DbParameter param1 = dpf.CreateParameter();
            param1.Value = costo;
            param1.ParameterName = "costo_pas";
            parametros.Add(param1);

            DbParameter param2 = dpf.CreateParameter();
            param2.Value = descripcion;
            param2.ParameterName = "descripcion_pas";
            parametros.Add(param2);

            DbParameter param3 = dpf.CreateParameter();
            param3.Value = byteImage;
            param3.ParameterName = "imagen_pas";
            parametros.Add(param3);

            return ejecuteNonQuery("insertarPastel", parametros);
        }


        public List<Cm_ClsPastel> listarPasteles() {
            List<Cm_ClsPastel> ListaPasteles = new List<Cm_ClsPastel>();

            string storeProcedure = "obtenerPastel";
            using (DbConnection con = dpf.CreateConnection()){
                con.ConnectionString = constr;
                using (DbCommand cmd = dpf.CreateCommand()) {
                    cmd.Connection = con;
                    cmd.CommandText = storeProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    using(DbDataReader dr = cmd.ExecuteReader()){
                        while(dr.Read()){
                            ListaPasteles.Add(
                                new Cm_ClsPastel((int)dr["id_pas"], 
                                    (string)dr["url_pas"], (string)dr["descripcion_pas"], 
                                    (decimal)dr["costo_pas"],(Byte[])dr["imagen_pas"])
                                );
                        }
                    }
                }
            }
            return ListaPasteles;
        }

        public Cm_ClsPastel listarPastelPorId(int idpastel) {
            Cm_ClsPastel obj_pastel = new Cm_ClsPastel();

            string storeProcedure = "obtenerPastelPorId";
            using (DbConnection con = dpf.CreateConnection())
            {
                con.ConnectionString = constr;
                using (DbCommand cmd = dpf.CreateCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = storeProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;

                    DbParameter param = cmd.CreateParameter();
                    param.DbType = DbType.Int32;
                    param.ParameterName = "id_pas";
                    param.Value = idpastel;

                    cmd.Parameters.Add(param);
                    con.Open();

                    using(DbDataReader dr = cmd.ExecuteReader()){
                        if(dr.Read()){
                            obj_pastel = new Cm_ClsPastel(idpastel, 
                                (string)dr["url_pas"], 
                                (string)dr["descripcion_pas"],
                                    (decimal)dr["costo_pas"], (Byte[])dr["imagen_pas"]);
                        }
                    
                    }
                    
                }
            }
            return obj_pastel;
        }

        public int actualizarPastel(int id, string url, string descripcion, decimal costo) {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param = dpf.CreateParameter();
            param.Value = id;
            param.ParameterName = "id_pas";
            parametros.Add(param);

            DbParameter param0 = dpf.CreateParameter();
            param0.Value = url;
            param0.ParameterName = "url_pas";
            parametros.Add(param0);

            DbParameter param1 = dpf.CreateParameter();
            param1.Value = costo;
            param1.ParameterName = "costo_pas";
            parametros.Add(param1);

            DbParameter param2 = dpf.CreateParameter();
            param2.Value = descripcion;
            param2.ParameterName = "descripcion_pas";
            parametros.Add(param2);

            return ejecuteNonQuery("modificarPastel", parametros);
        }
    }
}