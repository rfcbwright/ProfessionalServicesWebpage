using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Professional_Service_Time_Tracker
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Show_Completed_CheckedChanged(object sender, EventArgs e)
        {
            if (Show_Completed.Checked)
            {
                SqlDataSource1.SelectCommand = "SELECT [sales_order], [sold_to], [end_user], [project_complete], [p201_days], [p202_days], [p205_hours], [p206_engagement], [sales_rep], [P201_days_purchased], [P202_days_purchased], [P206_engagement_purchased], [P205_days_purchased] FROM [Backlog]";

            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [sales_order], [sold_to], [end_user], [project_complete], [p201_days], [p202_days], [p205_hours], [p206_engagement], [sales_rep], [P201_days_purchased], [P202_days_purchased], [P206_engagement_purchased], [P205_days_purchased] FROM [Backlog] where ([project_complete] = @project_complete)";

            }
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Claims Form " + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
    }
}