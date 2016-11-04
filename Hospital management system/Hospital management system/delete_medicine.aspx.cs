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
    public partial class delete_medicine : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand cmd;
        String med_id, mode, calldata, connstr, id, s, ddid, rid;
        protected void Page_Load(object sender, EventArgs e)
        {
            med_id = Request.QueryString["med_id"];
            try
            {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                String selectdep = "delete from medicine_info where med_id='" + med_id + "'";
                cmd = new SqlCommand(selectdep, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                conn.Close();
            }
            catch (Exception ex) { }
            Response.Redirect("add_medicine.aspx");
       

        }
    }
}