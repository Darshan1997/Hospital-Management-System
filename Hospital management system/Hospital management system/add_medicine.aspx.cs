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
    public partial class add_medicine : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        Literal lit = new Literal();
        StringBuilder str1 = new StringBuilder();
        String d_id, mode, calldata, connstr, id, s, ddid,rid;
        protected void Page_Load(object sender, EventArgs e)
        {
            mid.Text=randomnumber();
            showtable();
        }

        private void showtable()
        {

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();


            
            //reader = command.ExecuteReader();
            str1.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\">" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Medicine Id</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Medicine Name</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Quntity</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Amount</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Seller Name</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Date(Buy)</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Company Name</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Expiry Date</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >UPDATE INFO</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" >Remove </th>" +
                "</thead><tbody>");

            String selectmed = "select * from medicine_info";
            command = new SqlCommand(selectmed, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "med_info");
            foreach (DataRow row in data.Tables["med_info"].Rows)
            {

                str1.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                       "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + row["med_id"] + "</td>" +
                       "<td style=\"border-color:black;\">" + row["med_name"] + "</td>" +
                       "<td style=\"border-color:black;\">" + row["quantity"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["amount"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["seller"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["date_buy"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["company_name"] + "</td>" +
                        "<td style=\"border-color:black;\">" + row["expiry_date"] + "</td>" +
                        "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\"  href=" + "update_medicine.aspx?med_id=" + row["med_id"] + ">UPDATE</a></td>" +
                        "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "delete_medicine.aspx?med_id=" + row["med_id"] + ">REMOVE</a></td>" +
                        "</tr>");
            }
            str1.Append("</tbody></table></div></div>");
            lit.Text = str1.ToString();
            medlist.Controls.Add(lit);
            conn.Close();
        }

        public String randomnumber()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            Random rnd = new Random();
            id = rnd.Next(1, 150).ToString();
            String select = "select med_id from medicine_info";
            command = new SqlCommand(select, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "med_info");
            foreach (DataRow row in data.Tables["med_info"].Rows)
            {
                String did = (String)row["med_id"];
                if (did != id)
                {

                    rid = id;
                    //  succ = false;
                    break;
                }
            }
            if (rid == null) 
            {
                rid = id;
            }
            conn.Close();
            return rid;

           
        }

        protected void addmedicine_Click(object sender, EventArgs e)
        {
            //Response.Redirect("add_medicine.aspx");
            
            //try
            //{

                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                String insertdate = "insert into medicine_info(med_id,med_name,company_name,seller,date_buy,quantity,amount,expiry_date)" +
                    "values (@mid,@mname,@cname,@seller,@date,@qun,@amount,@edate)";

                command = new SqlCommand(insertdate, conn);
                
                command.Parameters.AddWithValue("@mid", mid.Text);
                command.Parameters.AddWithValue("@mname", mname.Text);
                command.Parameters.AddWithValue("@cname", cname.Text);
                command.Parameters.AddWithValue("@seller", sname.Text);
                command.Parameters.AddWithValue("@date", mdate.Text);
                command.Parameters.AddWithValue("@qun", qun.Text);
                command.Parameters.AddWithValue("@amount", amount.Text);
                command.Parameters.AddWithValue("@edate", edate.Text);

                reader = command.ExecuteReader();

                conn.Close();
                Response.Redirect("add_medicine.aspx");
            //}
           // catch(Exception ex){}*/
        }
    }
}