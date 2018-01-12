using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Newtonsoft.Json;

namespace WebPACS
{
    /// <summary>
    /// uploadvideo 的摘要说明
    /// </summary>
    public class uploadvideo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            foreach (string upload in context.Request.Files)
            {
                var path = AppDomain.CurrentDomain.BaseDirectory + "uploads/";
                var file = context.Request.Files[upload];
                if (file == null) continue;

                file.SaveAs(Path.Combine(path, context.Request.Form[0]));
            }
           
            context.Response.ContentType = "text/plain";
            context.Response.Write(JsonConvert.SerializeObject(context.Request.Form[0]) );
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}