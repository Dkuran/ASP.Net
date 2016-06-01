using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using CakeFactory.Comun;
using CakeFactory.Datos;

namespace CakeFactory.Negocio
{
    public class Ng_ClsPastel
    {
        public Ng_ClsPastel() { 
        
        }

        public int insertarPastel(string url, decimal costo, string descripcion, Byte[] byteImage)
        {
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();
            return dt_pastel.insertarPastel(url, costo, descripcion, byteImage);
        }

        public int actualizarPastel(int id, string url, decimal costo, string descripcion)
        {
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();
            return dt_pastel.actualizarPastel(id,url,descripcion, costo );
        }

        public List<Cm_ClsPastel> ObtenerPasteles() {
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();

            return dt_pastel.listarPasteles();
        }

        public Cm_ClsPastel ObtenerPastelPorId(int idpastel) {
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();

            return dt_pastel.listarPastelPorId(idpastel);
        }

    }
}