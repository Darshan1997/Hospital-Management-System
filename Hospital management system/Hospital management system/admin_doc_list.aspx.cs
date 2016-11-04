using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class admin_doc_list : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        int i = 0;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr, selectdoctor,qs, id, rid;
        protected void Page_Load(object sender, EventArgs e)
        {
            qs=(String)Request.QueryString["dep_name"];
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();



            selectdoctor = "select * from doctor_info where d_department='" + qs + "'";
            command = new SqlCommand(selectdoctor, conn);
            reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\">" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">Doctor_id</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">Doctor name</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">Doctor department</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Doctor category</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Contact No</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Experience</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Email</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Address</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Gender</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Achivments</th>" +

                "</thead><tbody>");

                while (reader.Read())
                {
                    i++;
                    str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                           "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + reader["d_id"] + "</td>" +
                           "<td style=\"border-color:black;\">" + reader["d_name"] + "</td>" +
                           "<td style=\"border-color:black;\">" + reader["d_department"] + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["d_category"] + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["d_contact_no"] + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["d_experience"] + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["d_email"] + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["d_address"] + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["d_gender"] + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["d_achivments"] + "</td>" +
                           "</tr>");
                }
                str.Append("</tbody></table></div></div>");
                lit.Text = str.ToString();
                doclist.Controls.Add(lit);

            }
            else 
            {
                docava.Text="NO DOCTOR IS AVAILABLE FOR "+qs+"";
            }
            
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_home.aspx");
        }
    }
}