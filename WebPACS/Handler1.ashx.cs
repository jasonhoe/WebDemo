using System;
using System.Web;
using System.IO;
using System.Web.Script.Serialization;
using Utility.DICOM;

namespace WebPACS
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler
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

                DicomUtility.Bmp2Dcm(Pic_Path, Pic_Path.Replace("png", "dcm"), img.Name, "F", img.Age.ToString(), img.ProcessNum, img.Modality,img.HospitalName );
                DicomUtility.SendDcm(Pic_Path.Replace("png", "dcm"), "127.0.0.1", 104);
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
    }/// <summary>
     /// 图像对象
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

        private string processnum;


        public string ImageData
        {
            get { return imagedata; }
            set { imagedata = value; }
        }

        public string ProcessNum { get => processnum; set => processnum = value; }
        public string Modality { get => modality; set => modality = value; }
        public string HospitalName { get => hospitalname; set => hospitalname = value; }

        private string modality;

        private string hospitalname;

    }
}