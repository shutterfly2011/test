using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using System.Data;

namespace WebApplication1
{
    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile) {
                if (Path.GetExtension(FileUpload1.FileName) == ".xlsx") {
                    ExcelPackage exPkg = new ExcelPackage(FileUpload1.FileContent);
                    //ExcelWorksheet sht = exPkg.Workbook.Worksheets.First;
                    //GridView1.DataSource = WorksheetTo
                    
                    GridView1.DataBind();
                }
            }
        }
        /*
        private DataTable WorksheetToDataTable(ExcelWorksheet wks, bool hasHeader = true) {
            DataTable dt = new System.Data.DataTable(wks.Name);
            int nTotColCount = wks.Dimension. End.Column;
            int nTotRowCount = wks.Dimension.End.Row;
            int nStartTow = hasHeader ? 2 : 1;
            ExcelRange wksRow;
            DataRow dr;
            
            foreach (firstRowCell in wks.Cells(1, 1, 1, nTotColCount)){
                dt.Columns.Add(hasHeader ? firstRowCell )
            }

        }
        */
        /*
        For Each firstRowCell In ws.Cells(1, 1, 1, totalCols)
            dt.Columns.Add(If(hasHeader, firstRowCell.Text, String.Format("Column {0}", firstRowCell.Start.Column)))
        Next
        For rowNum As Integer = startRow To totalRows
            wsRow = ws.Cells(rowNum, 1, rowNum, totalCols)
            dr = dt.NewRow()
            For Each cell In wsRow
                dr(cell.Start.Column - 1) = cell.Text
            Next
            dt.Rows.Add(dr)
        Next

        Return dt
    End Function
    */
    }
}