using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;    

namespace Hospital_management_system
{
    
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        int i=0;
        Literal con = new Literal();
        StringBuilder str =  new StringBuilder();
        String connstr;

        protected void Page_Load(object sender, EventArgs e)
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
             try
               {
                 String s = "";
                 String selectdata = "select * from department_info";
                 command = new SqlCommand(selectdata,conn);
                 reader = command.ExecuteReader();
             }
             catch (Exception ex)
             {
                 //throw ex;
             }
             if (reader.HasRows) 
             {
                 str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\"><th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">id</th><th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">department</th><th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">edit details</th><th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">remove department</th> <th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">Doctor list </th> </tr>" +
                "</thead><tbody>");
                 while (reader.Read())
                 {
                     i++;
                     str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                            "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + i + "</td>" +
                            "<td style=\"border-color:black;\">" + reader["department"] + "</td>" +
                            "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\"  href=" + "#?dep_name=" + reader["department"] + ">EDIT</a></td>" +
                            "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "delete_department.aspx?dep_name=" + reader["department"] + ">DELETE</a></td>" +
                            "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "admin_doc_list.aspx?dep_name=" + reader["department"] + ">INFO</a></td>" +
                     "</tr>");
                 }
                 str.Append("</tbody></table></div></div>");
                 con.Text = str.ToString();
                 pl.Controls.Add(con);
             }
             else
             {
                 avadep.Text = "No Department is Available.....";
             }
            
        }


        protected void update_Click(object sender, EventArgs e)
        {   
            Response.Redirect("admin_home.aspx");
        }
        protected void btn_click(object sender, EventArgs e) 
        {
            Button button = (Button)sender;
            string btn_id = button.ID;
            Session["department_id"] = btn_id;
            Response.Redirect("edit_department.aspx");
        }


        protected void linkbtn_Click1(object sender, EventArgs e)
        {

            Response.Redirect("add_department.aspx");

        }


    }
}
        
 