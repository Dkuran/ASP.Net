using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Windows.Forms;
using CakeFactory.Comun;
using CakeFactory.Negocio;

namespace CakeFactory.Presentacion
{
    public partial class Pastel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                loadGrid();
                loadDropDownList();
                drppasteles.AutoPostBack = true;
            }
        }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {


            if((flufotopastel.PostedFile != null) && (flufotopastel.PostedFile.ContentLength > 0 ) && Page.IsValid){
                HttpPostedFile archivoimagen = flufotopastel.PostedFile;
                Byte[] byteImage = new Byte[flufotopastel.PostedFile.ContentLength];
                archivoimagen.InputStream.Read(byteImage, 0, flufotopastel.PostedFile.ContentLength);

                Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
                if ((ng_pastel.insertarPastel(txturl.Text, decimal.Parse(txtcosto.Text), txtdescripcion.Text, byteImage) > 0))
                {
                    loadGrid();
                    clean();
                    loadDropDownList();
                    string script = @"<script type='text/javascript'>
                
                    alert('Pastel Registrado! ');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page),
                        "Cake Factory", script, false);
                }
            }
        }

        private void loadGrid() {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            grvpasteles.DataSource = ng_pastel.ObtenerPasteles();
            grvpasteles.DataBind();
        }

        private void clean() { 
            txturl.Text = null;
            txtcosto.Text = null;
            txtdescripcion.Text = null;
        }

        private void loadDropDownList(){
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            drppasteles.DataSource = ng_pastel.ObtenerPasteles();
            drppasteles.DataValueField = "id_pas";
            drppasteles.DataTextField = "descripcion_pas";
            drppasteles.DataBind();

        }

        protected void drppasteles_TextChanged(object sender, EventArgs e)
        {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            Cm_ClsPastel cm_pastel = ng_pastel.ObtenerPastelPorId(Convert.ToInt16(drppasteles.SelectedValue));
            mostrarDatos(cm_pastel);
        }

        protected void mostrarDatos(Cm_ClsPastel cm_pastel) {
            txturl.Text = cm_pastel.Url_pas;
            txtcosto.Text = cm_pastel.Costo_pas.ToString();
            txtdescripcion.Text = cm_pastel.Descripcion_pas;
            Session.Add("id", drppasteles.SelectedValue);
            imgpastel.ImageUrl = "http://localhost:1532/Presentacion/imagen.aspx?ID=" + drppasteles.SelectedValue;
            lblnombre.Text = "Decripción: " + cm_pastel.Descripcion_pas;
            lblcosto.Text = "$ " + cm_pastel.Costo_pas.ToString();
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            if ((ng_pastel.actualizarPastel(Convert.ToInt16(drppasteles.SelectedValue),txturl.Text,decimal.Parse(txtcosto.Text), txtdescripcion.Text) > 0))
            {
                loadGrid();
                clean();
                loadDropDownList();
                string script = @"<script type='text/javascript'>
                
                alert('Pastel Modificado! ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Cake Factory", script, false);
            }
        }


    }
}