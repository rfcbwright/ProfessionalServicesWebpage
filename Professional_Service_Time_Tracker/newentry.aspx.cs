using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Professional_Service_Time_Tracker
{
    public partial class time_entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                SqlDataSource1.Insert();

                SalesOrder.Text = string.Empty;
                EndCustomer.Text = string.Empty;
                EndUser.Text = string.Empty;
                P201.Text = string.Empty;
                P202.Text = string.Empty;
                P205.Text = string.Empty;
                P206.Text = string.Empty;
                SalesRep.Text = string.Empty;
                SoldTo.Text = string.Empty;
            }
            catch (System.Data.SqlClient.SqlException error)
            {
                Label1.Text = error.Message;

            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}