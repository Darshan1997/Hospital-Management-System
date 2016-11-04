using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class delete_patient : System.Web.UI.Page
    {
        String pid;
        SqlConnection conn;
        SqlCommand cmd;
        String d_id, connstr;
        protected void Page_Load(object sender, EventArgs e)
        {
            pid = Request.QueryString["pid"];

            try
            {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                String selectdep = "delete from patient where pid='" + pid + "'";
                cmd = new SqlCommand(selectdep, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                conn.Close();
            }
            catch (Exception ex) { }
            Response.Redirect("rec_patient_registration.aspx");
        }
    }
}