using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class update_medicine : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        String d_id, mode, calldata, connstr, id, s, ddid, rid;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            d_id = Request.QueryString["med_id"];

            error.Text = d_id;
            if (Session["on"] == null)
            {
                Session["docid"] = d_id;
                ddid = Session["docid"].ToString();
                Session["on"] = true;
            }


            fillfields();
        }

        private void fillfields()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
            
            calldata = "select * from medicine_info where med_id='" + ddid + "'";
            command = new SqlCommand(calldata, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "up");
            foreach (DataRow row in data.Tables["up"].Rows)
            {
                mid.Text = row["med_id"].ToString();
                mname.Text = row["med_name"].ToString();
                cname.Text = row["company_name"].ToString();
                sname.Text = row["seller"].ToString();
                mdate.Text = row["date_buy"].ToString();
                qun.Text = row["quantity"].ToString();
                amount.Text = row["amount"].ToString();
                edate.Text = row["expiry_date"].ToString();
            }
            conn.Close();
        }

        protected void updatemedicine_Click(object sender, EventArgs e)
        {

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String updatedate = "update  medicine_info set med_id=@mid,med_name=@mname,company_name=@cname,seller=@seller,date_buy=@date,quantity=@qun,amount=@amount,expiry_date=@edate where med_id='" + d_id + "'";

            command = new SqlCommand(updatedate, conn);

            command.Parameters.AddWithValue("@mid", mid.Text);
            command.Parameters.AddWithValue("@mname", mname.Text);
            command.Parameters.AddWithValue("@cname", cname.Text);
            command.Parameters.AddWithValue("@seller", sname.Text);
            command.Parameters.AddWithValue("@date", mdate.Text);
            command.Parameters.AddWithValue("@qun", qun.Text);
            command.Parameters.AddWithValue("@amount", amount.Text);
            command.Parameters.AddWithValue("@edate", edate.Text);

            reader = command.ExecuteReader();

            Session["on"] = null;
            Session["docid"] = null;

            
            conn.Close();
            Response.Redirect("add_medicine.aspx");
            
        }
    }
}