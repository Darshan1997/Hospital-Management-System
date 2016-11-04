using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlCommand command; 
        SqlDataReader reader;
        int i = 0;
        Literal con = new Literal();
        StringBuilder str = new StringBuilder();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            String name = (String)Request.QueryString["dep_name"];

            String connstring = "Data Source=ABCD;initial catalog=HMS;integrated security=true";
            SqlConnection conn = new SqlConnection(connstring);
            try
            {
                conn.Open();
                 command = new SqlCommand();
                command.Parameters.AddWithValue("@name", name);
                String selectdata = "select * from department_info where department=@name";
                command.Connection = conn;
                command.CommandText = selectdata;
                reader = command.ExecuteReader();
                
            }
                
            catch (Exception ex)
            {

            }
            while (reader.Read())
            {
                dep_id.Text = (String)reader["id"];
                dep_name.Text = (String)reader["department"];
                dep_textarea.InnerText = (String)reader["description"];    
            }
                reader.Close();
            
            command.Parameters.AddWithValue("@dep", dep_name.Text);
            String selectdata1 = "select * from doctor_info_client where d_department=@dep";
            command.Connection = conn;
            command.CommandText = selectdata1;
            reader = command.ExecuteReader();
            str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table  id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\"><th  class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">doctor_id</th><th  class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">doctor_name</th><th  class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">doctor_department</th><th  class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">doctor_info</th></tr>" +
                "</thead><tbody>");
            while (reader.Read())
            {
                i++;
                str.Append("<tr  role=\"row\" class=\"even\">" +
                       "<td  class=\"sorting_1\">" + reader["d_id"] + "</td>" +
                       "<td >" + reader["d_name"] + "</td>" +
                       "<td >" + reader["d_department"] + "</td>" +
                       "<td ><a href=" + "info_doctor.aspx?dep_id=" + i + ">INFO</a></td>" +
                     "</tr>");
            }
            str.Append("</tbody></table></div></div>");
            con.Text = str.ToString();
            //dep_placeholder.Controls.Add(con);

            reader.Close();
            conn.Close();
                
        }

        protected void update_Click(object sender, EventArgs e)
        {
            
        }
    }
}