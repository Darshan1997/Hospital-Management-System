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
      
    public partial class doctor_module : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr, selectdoctor, id, rid, upid;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["doctor"] == null) 
            {
                Response.Redirect("loginpage.aspx?msg=false");
            }
            Session["docmodule"] = true;

            username.Text = Session["username"].ToString();
            usnm.Text = Session["username"].ToString();
            generatepatientlist();
        }

private void generatepatientlist()
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
              //  "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >checkout date</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Doctor</th>" +
               // "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\">update info</th>" +
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
                      //  "<td style=\"border-color:black;\">" + reader["check_out"] + "</td>" +
                        "<td style=\"border-color:black;\">" + Session["username"] + "</td>" +
                 //       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\"  href=" + "update_patient.aspx?pid=" + reader["pid"] + ">UPDATE</a></td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "info_patient.aspx?pid=" + reader["pid"] + ">INFO</a></td>" +
                       "</tr>");
                
            }
            str.Append("</tbody></table></div></div>");
            lit.Text = str.ToString();
    
            patientlist.Controls.Add(lit);


            conn.Close();    

}

protected void signout_Click(object sender, EventArgs e)
{
    Session["doctor"] = null;
    Session["username"] = null;
    Session["docmodule"] = null;
    Response.Redirect("loginpage.aspx");
}

protected void profile_Click(object sender, EventArgs e)
{

}
    }
}