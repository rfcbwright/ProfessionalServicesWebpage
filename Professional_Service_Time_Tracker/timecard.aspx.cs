using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Professional_Service_Time_Tracker
{
    public partial class newcustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EndCustomer.DataBind();
            if (P201.Text == "")
            {
                P201.Text = "0";
            }
            if (P202.Text == "")
            {
                P202.Text = "0";
            }
            if (P205.Text == "")
            {
                P205.Text = "0";
            }
            if (P206.Text == "")
            {
                P206.Text = "0";
            }
            ListBox1.DataBind();
            ListBox2.DataBind();
            ListBox3.DataBind();
            ListBox4.DataBind();
            ListBox5.DataBind();
            int timefield = Convert.ToInt32(ListBox5.Items[0].Text);
            int timeentry = timefield+1;
            TextBox5.Text = timeentry.ToString();
            
        }

        protected void EntrySubmit_Click(object sender, EventArgs e)
        {

            if (Convert.ToInt32(TextBox1.Text) >= 0 && Convert.ToInt32(TextBox2.Text) >= 0 && Convert.ToInt32(TextBox3.Text) >= 0 && Convert.ToInt32(TextBox4.Text) >= 0)
            {
                if (TextBox1.Text == "0" && TextBox2.Text == "0" && TextBox3.Text == "0" && TextBox4.Text == "0")
                {
                    SqlDataSource3.UpdateCommand = "UPDATE Backlog SET p201_days = @p201, p202_days = @p202, p205_hours = @p205, p206_engagement = @p206, project_complete = @project_complete WHERE (sales_order = @sales_order)";
                }
                else
                {
                    SqlDataSource3.UpdateCommand = "UPDATE Backlog SET p201_days = @p201, p202_days = @p202, p205_hours = @p205, p206_engagement = @p206 WHERE (sales_order = @sales_order)";
                }

                try
                {

                    SqlDataSource3.Insert();
                    SqlDataSource3.Update();
                    
                    BeginDate.SelectedDates.Clear();
                    EndDate.SelectedDates.Clear();
                    Location.Text = String.Empty;
                    P201.Text = "0";
                    P202.Text = "0";
                    P205.Text = "0";
                    P206.Text = "0";

                    Comments.Text = String.Empty;
                    EndUser.Text = String.Empty;
                    Response.Redirect("~/timecard.aspx");

                }
                catch (System.Data.SqlClient.SqlException error)
                {
                    Label8.Text = error.Message;

                }
            }
            else
            {
                Label8.Text = "Remaining time must be greater than or equal to 0.";
            }
        }

        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            EndCustomer.DataBind();
            if (P201.Text == "")
            {
                P201.Text = "0";
            }
            if (P202.Text == "")
            {
                P202.Text = "0";
            }
            if (P205.Text == "")
            {
                P205.Text = "0";
            }
            if (P206.Text == "")
            {
                P206.Text = "0";
            }
            ListBox1.DataBind();
            ListBox2.DataBind();
            ListBox3.DataBind();
            ListBox4.DataBind();
            //int P201dayspurchased = Convert.ToInt32(ListBox1.Items[0].Text);
            //int P201daysleft = P201dayspurchased - Convert.ToInt32(P201.Text);
            //TextBox1.Text = P201daysleft.ToString();
            int P201dayspurchased = Convert.ToInt32(ListBox1.Items[0].Text);
            int P201daysleft = P201dayspurchased - Convert.ToInt32(P201.Text);
            TextBox1.Text = P201daysleft.ToString();

            int P202dayspurchased = Convert.ToInt32(ListBox2.Items[0].Text);
            int P202daysleft = P202dayspurchased - Convert.ToInt32(P202.Text);
            TextBox2.Text = P202daysleft.ToString();

            int P205hourspurchased = Convert.ToInt32(ListBox3.Items[0].Text);
            int P205hoursleft = P205hourspurchased - Convert.ToInt32(P205.Text);
            TextBox3.Text = P205hoursleft.ToString();

            int P206purchased = Convert.ToInt32(ListBox4.Items[0].Text);
            int P206left = P206purchased - Convert.ToInt32(P206.Text);
            TextBox4.Text = P206left.ToString();
                        
        }

        protected void RFCEngineer_TextChanged(object sender, EventArgs e)
        {

        }

        protected void P201_TextChanged(object sender, EventArgs e)
        {
           
            if ( P201.Text == "")
            {
                P201.Text = "0";
            }
            if (P202.Text == "")
            {
                P202.Text = "0";
            }
            if (P205.Text == "")
            {
                P205.Text = "0";
            }
            if (P206.Text == "")
            {
                P206.Text = "0";
            }

            int P201dayspurchased = Convert.ToInt32(ListBox1.Items[0].Text);
                int P201daysleft = P201dayspurchased - Convert.ToInt32(P201.Text);
                TextBox1.Text = P201daysleft.ToString();
                                    
                int P202dayspurchased = Convert.ToInt32(ListBox2.Items[0].Text);
                int P202daysleft = P202dayspurchased - Convert.ToInt32(P202.Text);
                TextBox2.Text = P202daysleft.ToString();
            
                int P205hourspurchased = Convert.ToInt32(ListBox3.Items[0].Text);
                int P205hoursleft = P205hourspurchased - Convert.ToInt32(P205.Text);
                TextBox3.Text = P205hoursleft.ToString();
            
                int P206purchased = Convert.ToInt32(ListBox4.Items[0].Text);
                int P206left = P206purchased - Convert.ToInt32(P206.Text);
                TextBox4.Text = P206left.ToString();
            
        }

        
        protected void P202_TextChanged(object sender, EventArgs e)
        {
            if (P201.Text == "")
            {
                P201.Text = "0";
            }
            if (P202.Text == "")
            {
                P202.Text = "0";
            }
            if (P205.Text == "")
            {
                P205.Text = "0";
            }
            if (P206.Text == "")
            {
                P206.Text = "0";
            }

            int P201dayspurchased = Convert.ToInt32(ListBox1.Items[0].Text);
            int P201daysleft = P201dayspurchased - Convert.ToInt32(P201.Text);
            TextBox1.Text = P201daysleft.ToString();

            int P202dayspurchased = Convert.ToInt32(ListBox2.Items[0].Text);
            int P202daysleft = P202dayspurchased - Convert.ToInt32(P202.Text);
            TextBox2.Text = P202daysleft.ToString();

            int P205hourspurchased = Convert.ToInt32(ListBox3.Items[0].Text);
            int P205hoursleft = P205hourspurchased - Convert.ToInt32(P205.Text);
            TextBox3.Text = P205hoursleft.ToString();

            int P206purchased = Convert.ToInt32(ListBox4.Items[0].Text);
            int P206left = P206purchased - Convert.ToInt32(P206.Text);
            TextBox4.Text = P206left.ToString();
        }

        protected void P205_TextChanged(object sender, EventArgs e)
        {
            if (P201.Text == "")
            {
                P201.Text = "0";
            }
            if (P202.Text == "")
            {
                P202.Text = "0";
            }
            if (P205.Text == "")
            {
                P205.Text = "0";
            }
            if (P206.Text == "")
            {
                P206.Text = "0";
            }

            int P201dayspurchased = Convert.ToInt32(ListBox1.Items[0].Text);
            int P201daysleft = P201dayspurchased - Convert.ToInt32(P201.Text);
            TextBox1.Text = P201daysleft.ToString();

            int P202dayspurchased = Convert.ToInt32(ListBox2.Items[0].Text);
            int P202daysleft = P202dayspurchased - Convert.ToInt32(P202.Text);
            TextBox2.Text = P202daysleft.ToString();

            int P205hourspurchased = Convert.ToInt32(ListBox3.Items[0].Text);
            int P205hoursleft = P205hourspurchased - Convert.ToInt32(P205.Text);
            TextBox3.Text = P205hoursleft.ToString();

            int P206purchased = Convert.ToInt32(ListBox4.Items[0].Text);
            int P206left = P206purchased - Convert.ToInt32(P206.Text);
            TextBox4.Text = P206left.ToString();

        }

        protected void P206_TextChanged(object sender, EventArgs e)
        {
            if (P201.Text == "")
            {
                P201.Text = "0";
            }
            if (P202.Text == "")
            {
                P202.Text = "0";
            }
            if (P205.Text == "")
            {
                P205.Text = "0";
            }
            if (P206.Text == "")
            {
                P206.Text = "0";
            }

            int P201dayspurchased = Convert.ToInt32(ListBox1.Items[0].Text);
            int P201daysleft = P201dayspurchased - Convert.ToInt32(P201.Text);
            TextBox1.Text = P201daysleft.ToString();

            int P202dayspurchased = Convert.ToInt32(ListBox2.Items[0].Text);
            int P202daysleft = P202dayspurchased - Convert.ToInt32(P202.Text);
            TextBox2.Text = P202daysleft.ToString();

            int P205hourspurchased = Convert.ToInt32(ListBox3.Items[0].Text);
            int P205hoursleft = P205hourspurchased - Convert.ToInt32(P205.Text);
            TextBox3.Text = P205hoursleft.ToString();

            int P206purchased = Convert.ToInt32(ListBox4.Items[0].Text);
            int P206left = P206purchased - Convert.ToInt32(P206.Text);
            TextBox4.Text = P206left.ToString();
        }
    }
}