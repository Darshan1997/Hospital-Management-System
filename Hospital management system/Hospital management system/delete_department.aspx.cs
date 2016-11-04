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
    public partial class delete_department : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command,command1;
        SqlDataReader reader,reader1;
        String connstr,name;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            name = (String)Request.QueryString["dep_name"];
    
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

        
              //  Label1.Text = "" + name;
                String deldoc = "delete from doctor_info where d_department=@name1";
                String selectdata = "delete from department_info where department=@name";
                command1 = new SqlCommand(deldoc, conn);
                command = new SqlCommand(selectdata,conn);
                command.Parameters.AddWithValue("@name", name);
                command1.Parameters.AddWithValue("@name1", name);
                reader1 = command1.ExecuteReader();
                reader1.Close();
                reader = command.ExecuteReader();
                reader.Close();
                
                conn.Close();
               Response.Redirect("admin_home.aspx");
        
        
        }

        
        
    }
}