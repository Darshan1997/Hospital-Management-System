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
    public partial class rec_room : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr, selectdoctor, id, rid,roomtype;
        int flag = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            showtable();  
            if (!IsPostBack) 
            {
                filldoclist();
                
            }
            
            

            if (IsPostBack) 
            {

                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                rno.Items.Clear();
                roomtype = rtype.Text;

                String selectdata = "select room_no from rooms_info where room_type=@rtype and room_status='free'";
                command = new SqlCommand(selectdata, conn);
                command.Parameters.AddWithValue("@rtype", roomtype);
                command.Parameters.AddWithValue("@rstatus", roomtype);

                SqlDataAdapter ada = new SqlDataAdapter(command);
                DataSet data = new DataSet();
                ada.Fill(data, "db");
                foreach (DataRow row in data.Tables["db"].Rows)
                {
                    flag++;
                    String rnores = (String)row["room_no"];
                    rno.Items.Add(rnores);
                }
                if (flag == 0) 
                {
                    errormsg.Text = "no rooms is availble";
                    bookroom.Enabled = false;
                }
                if (flag>0) 
                {
                    errormsg.Text = "";

                    bookroom.Enabled = true;
                }

                


                conn.Close();
            }

        }

        private void showtable()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();


            String selectdata = "select *  from rooms";
            command = new SqlCommand(selectdata, conn);
            reader = command.ExecuteReader();
            str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
                "<thead>" +
                 "<tr  role=\"row\">" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">pid</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">Doctor name</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">allocation date</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">discharge date</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">room no</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">room type</th>" +
                 "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">REMOVE</th>" +
                 "</thead><tbody>");

           while(reader.Read())
            {
                
                str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                       "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + reader["pid"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["doctor"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["allocation_date"] + "</td>" +
                        "<td style=\"border-color:black;\">" + reader["discharge_date"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["room_no"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["type"] + "</td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "delete_room.aspx?room_no=" + reader["room_no"] +">REMOVE</a></td>" + 
                       "</tr>");
            }

           str.Append("</tbody></table></div></div>");
           lit.Text = str.ToString();
           bedlist.Controls.Add(lit);

           conn.Close();
        }

        private void filldoclist()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String selectdep = "select d_name,d_department from doctor_info";
            SqlCommand cmd = new SqlCommand(selectdep, conn);
            SqlDataAdapter adadoc = new SqlDataAdapter(cmd);
            DataSet datadoc = new DataSet();
            adadoc.Fill(datadoc, "docmenu");
            foreach (DataRow row in datadoc.Tables["docmenu"].Rows)
            {
                String docname = (String)row["d_name"];
                String ddepartment = (String)row["d_department"];
                String namedep = "" + docname + "(" + ddepartment + ")";
                dname.Items.Add(namedep);
            }

            //////////filling doctor menu///////////
            roomtype = rtype.Text;

                String selectdata = "select room_no from rooms_info where room_type=@rtype and room_status='free'";
                command = new SqlCommand(selectdata, conn);
                command.Parameters.AddWithValue("@rtype", roomtype);
                command.Parameters.AddWithValue("@rstatus", roomtype);

                SqlDataAdapter ada = new SqlDataAdapter(command);
                DataSet data = new DataSet();
                ada.Fill(data, "db");
                foreach (DataRow row in data.Tables["db"].Rows)
                {
                    flag++;
                    String rnores = (String)row["room_no"];
                    rno.Items.Add(rnores);
                }
                if (flag == 0) 
                {
                    errormsg.Text = "no rooms is availble";
                    bookroom.Enabled = false;
                }
                if (flag > 0) 
                {
                    errormsg.Text = "";
                    bookroom.Enabled = true;     
                }

            ///////////////filling patient menu///////////////


                String selectpatient = "select pid,name from patient";
                command = new SqlCommand(selectpatient, conn);
            
                SqlDataAdapter adapatient = new SqlDataAdapter(command);
                DataSet datapatient = new DataSet();
                adapatient.Fill(datapatient, "db");
                foreach (DataRow row in datapatient.Tables["db"].Rows)
                {
                    //flag++;
                    String pm = (String)row["name"];
                    String pidpa =(String)row["pid"];
                    String patientname=""+pm+"("+pidpa+")";
                    pmenu.Items.Add(patientname);
                }
            
            conn.Close();
        }

      

        protected void bookroom_Click(object sender, EventArgs e)
        {

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String  gotpid = getpid();

            String insertdata = "insert into rooms (pid,status,doctor,allocation_date,discharge_date,days,room_no,type)"+
                "values (@pid,'notfree',@doctor,@allodate,'','15',@roomno,@roomtype)";

            command = new SqlCommand(insertdata, conn);
            command.Parameters.AddWithValue("@doctor", dname.Text);
            command.Parameters.AddWithValue("@allodate", allodate.Text);
            command.Parameters.AddWithValue("@disdate","");
            command.Parameters.AddWithValue("@roomno", rno.Text);
            command.Parameters.AddWithValue("@roomtype", rtype.Text);
            command.Parameters.AddWithValue("@pid", gotpid);

            reader = command.ExecuteReader();
            conn.Close();

            conn.Open();
            String updaterooinfo = "update rooms_info set room_status='notfree' where room_type=@roomtype and room_no=@roomno";
            
            command = new SqlCommand(updaterooinfo, conn);
            command.Parameters.AddWithValue("@roomno", rno.Text);
            
            command.Parameters.AddWithValue("@roomtype", rtype.Text);
            

            reader = command.ExecuteReader();

            conn.Close();

            Response.Redirect("rec_room.aspx");
        }

        private String getpid()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
            

                String selectpatient = "select pid,name from patient";
                command = new SqlCommand(selectpatient, conn);
                SqlDataAdapter adapatient = new SqlDataAdapter(command);
                DataSet datapatient = new DataSet();
                adapatient.Fill(datapatient, "db");
                foreach (DataRow row in datapatient.Tables["db"].Rows)
                {
                    String pm = (String)row["name"];
                    int pidpa = (int)row["pid"];
                    String patientname = "" + pm + "(" + pidpa + ")";

                    if (patientname == pmenu.Text) 
                    {
                        rid =""+pidpa;
                    }
                }
                return rid;
        }
    }
}