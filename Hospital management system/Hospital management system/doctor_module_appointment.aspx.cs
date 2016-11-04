using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class doctor_module_appointment : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr, selectappointment, id, rid, docname;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["docmodule"] == null && Session["doctor"] == null)
            {
                Response.Redirect("loginpage.aspx?msg=false");
            }
            username.Text = Session["username"].ToString();
            usnm.Text = Session["username"].ToString();

            generatingappoimtentlist();
        }

        private void generatingappoimtentlist()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            selectappointment = "select * from appointment_info";
            command = new SqlCommand(selectappointment, conn);
            SqlDataAdapter adapterappointment = new SqlDataAdapter(command);
            DataSet dataappointment = new DataSet();
            adapterappointment.Fill(dataappointment, "appointment");
            str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\">" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">Appointment_id</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">Doctor Name</th>" +
                     "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Doctor Department</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">Patient Name</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Patient Contectno</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Time</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Date</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Remove</th>" +
                "</thead><tbody>");

            foreach (DataRow row in dataappointment.Tables["appointment"].Rows)
            {
           
                str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                       "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + row["app_id"] + "</td>" +
                       "<td style=\"border-color:black;\">" + row["d_name"] + "</td>" +
                       "<td style=\"border-color:black;\">" + row["d_department"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["patient_name"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["p_contactno"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["time"] + "</td>" +
                       "<td style=\"border-color:black;\">" + row["date"] + "</td>" +
                        "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "remove_appointment.aspx?app_id=" + row["app_id"] + ">REMOVE</a></td>" +
                       "</tr>");
            }
            str.Append("</tbody></table></div></div>");
            lit.Text = str.ToString();
            appointmentlist.Controls.Add(lit);
            conn.Close();
        }

        protected void profile_Click(object sender, EventArgs e)
        {

        }

        protected void signout_Click(object sender, EventArgs e)
        {
            Session["doctor"] = null;
            Session["username"] = null;
            Session["docmodule"] = null;
            Response.Redirect("loginpage.aspx");
        }
    }
}