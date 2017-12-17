<%@ WebHandler Language="C#" Class="UEditorHandler" %>

using System;
using System.Web;
using System.IO;
using System.Collections;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web.Script.Serialization;
using Utility.DICOM;


public class UEditorHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {


        StreamReader reader = new StreamReader(context.Request.InputStream);
        string inputstr = HttpUtility.UrlDecode(reader.ReadToEnd());
        JavaScriptSerializer js = new JavaScriptSerializer();
        Img img = js.Deserialize<Img>(inputstr);
        if (img != null)
        {
            string Pic_Path = HttpContext.Current.Server.MapPath(img.Name + ".png");

            using (FileStream fs = new FileStream(Pic_Path, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(img.ImageData);
                    bw.Write(data);
                    bw.Close();
                }
            }
 
            DicomUtility.Bmp2Dcm(Pic_Path, Pic_Path.Replace("png", "dcm"), img.Name, "F", img.Age.ToString(), "123", "US", "≤‚ ‘ Ë∫ˆæ÷");
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("suc");

    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
/// <summary>
/// ÕºœÒ∂‘œÛ
/// </summary>
public class Img
{
    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private int age;

    public int Age
    {
        get { return age; }
        set { age = value; }
    }
    private string imagedata;

    public string ImageData
    {
        get { return imagedata; }
        set { imagedata = value; }
    }
}