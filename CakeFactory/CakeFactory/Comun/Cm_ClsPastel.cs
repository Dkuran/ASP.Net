using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CakeFactory.Comun
{
    public class Cm_ClsPastel
    {
        private Byte[] byteImage;

        public Byte[] ByteImage
        {
            get { return byteImage; }
            set { byteImage = value; }
        }


        private int id_pas;

        public int Id_pas
        {
            get { return id_pas; }
            set { id_pas = value; }
        }
        private string url_pas;

        public string Url_pas
        {
            get { return url_pas; }
            set { url_pas = value; }
        }
        private string descripcion_pas;

        public string Descripcion_pas
        {
            get { return descripcion_pas; }
            set { descripcion_pas = value; }
        }
        private decimal costo_pas;

        public decimal Costo_pas
        {
            get { return costo_pas; }
            set { costo_pas = value; }
        }

        public Cm_ClsPastel() { 
        
        }

        public Cm_ClsPastel(int id_pas, string url_pas, string descripcion_pas, decimal costo_pas, Byte[] byteImage)
        {
            this.id_pas = id_pas;
            this.url_pas = url_pas;
            this.descripcion_pas = descripcion_pas;
            this.costo_pas = costo_pas;
            this.byteImage = new Byte[byteImage.Length];
            this.byteImage = byteImage;
            /*for (int i = 0; i < byteImage.Length; i ++ )
            {
                this.byteImage[i] = byteImage[i];
            }*/



        }
    }
}