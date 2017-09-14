<%@ WebHandler Language="C#" Class="UEditorHandler" %>

using System;
using System.Web;
using System.IO;
using System.Collections;

public class UEditorHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        
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