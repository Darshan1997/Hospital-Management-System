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
    public partial class remove_appointment : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        String app_id, connstr;
        protected void Page_Load(object sender, EventArgs e)
        {
            app_id = Request.QueryString["app_id"];

            try
            {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();
                String deleteappointment = "delete from appointment_info where app_id='" + app_id + "'";
                cmd = new SqlCommand(deleteappointment, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                conn.Close();
            }
            catch (Exception ex) { }
            Response.Redirect("resepsenist_admin.aspx");
        }
    }
}