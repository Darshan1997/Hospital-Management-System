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
    public partial class addmedicine : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        Literal lit = new Literal();
        StringBuilder str1 = new StringBuilder();
        String d_id, mode, calldata, connstr, id, s, ddid, rid;
        protected void Page_Load(object sender, EventArgs e)
        {
            mid.Text = randomnumber();
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

        protected void addmedicine1_Click(object sender, EventArgs e)
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