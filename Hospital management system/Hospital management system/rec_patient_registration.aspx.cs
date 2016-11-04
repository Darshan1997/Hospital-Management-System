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
    public partial class rec_patient_registration : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr, selectdoctor, id, rid,upid;
        protected void Page_Load(object sender, EventArgs e)
        {
            generatepid();

            generatingpatientlist();

        }

        private void generatingpatientlist()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();


            selectdoctor = "select * from patient";
            command = new SqlCommand(selectdoctor, conn);
            reader = command.ExecuteReader();
            str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\">" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >PID</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >patient name</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Type</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >City</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Contactno</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >checkin date</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >checkout date</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Gender</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\">update info</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Remove Doctor</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >More Info</th>" +
                "</thead><tbody>");
            
            while (reader.Read())
            {
                str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                      "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + reader["pid"] + "</td>" +
                      "<td style=\"border-color:black;\">" + reader["name"] + "</td>" +
                      "<td style=\"border-color:black;\">" + reader["type"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["state"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["contact_no"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["check_in"] + "</td>" +
                        "<td style=\"border-color:black;\">" + reader["check_out"] + "</td>" +
                        "<td style=\"border-color:black;\">" + reader["gender"] + "</td>" +
                        "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\"  href=" + "update_patient.aspx?pid=" + reader["pid"] + ">UPDATE</a></td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "delete_patient.aspx?pid=" + reader["pid"] + ">REMOVE</a></td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "info_patient.aspx?pid=" + reader["pid"] + ">INFO</a></td>" +
                       "</tr>");
                
            }
            str.Append("</tbody></table></div></div>");
            lit.Text = str.ToString();

            staffplaceholder.Controls.Add(lit);


            conn.Close();    

        }

        private String generatepid()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();


            Random rnd = new Random();
            id = rnd.Next(1, 150).ToString();
            String select = "select * from patient";
            command = new SqlCommand(select, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "patientid");
            foreach (DataRow row in data.Tables["patientid"].Rows)
            {
               String did = ""+row["pid"];
                if (did != id)
                {
                    rid = id;
                    break;
                }
            }
            if (rid == null)
            {
                rid = id;
            }
            pid.Text = rid;
            
            conn.Close();

            return rid;
        }

        protected void Registra_patient_Click(object sender, EventArgs e)
        {
            
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
            
            String text = "insert into patient (pid,name,gender,address,city,state,blood_group,contact_no,check_in,type,age)" +
                "values (@number,@name,@gender,@address,@city,@state,@bloodgroup,@contactno,@checkdate,@type,@age)";
            command = new SqlCommand(text, conn);
            command.Parameters.AddWithValue("@name", pname.Text);
            command.Parameters.AddWithValue("@number",upid);
            command.Parameters.AddWithValue("@state", pstate.Text);
            command.Parameters.AddWithValue("@city", pcity.Text);
            command.Parameters.AddWithValue("@status", s_status.Text);
            command.Parameters.AddWithValue("@address", address.InnerText);
            command.Parameters.AddWithValue("@contactno", contactno.Text);
            command.Parameters.AddWithValue("@checkdate", jdate.Text);
            command.Parameters.AddWithValue("@email", email.Text);
            command.Parameters.AddWithValue("@bloodgroup", blood_group.Text);
           // command.Parameters.AddWithValue("@status", s_status.Text);
            command.Parameters.AddWithValue("@type", type.Text);
            command.Parameters.AddWithValue("@age", age.Text);

            if (radio.Checked)
            {
                command.Parameters.AddWithValue("@gender", "M");
            }
            else
            {
                command.Parameters.AddWithValue("@gender", "F");
            }
            SqlDataReader reader = command.ExecuteReader();
            conn.Close();
            Response.Redirect("rec_patient_registration.aspx");



            conn.Close();

        }

        
    }
}