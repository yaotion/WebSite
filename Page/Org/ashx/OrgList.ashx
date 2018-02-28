<%@ WebHandler Language="C#" Class="OrgList" %>

using System;
using System.Web;
using System.Collections.Generic;
public class JsonTreeItem
{
    public string id;
    public string _parentId;
    public string name = "222";

    public string DeptName;
    public string DeptTypeID;
    public string DeptOrder;

    public string strUrlDescription;
}
public class JsonTree
{
    public int total;
    public List<JsonTreeItem> rows  = new List<JsonTreeItem>();
}
public class OrgList : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string orgJson = GetOrgJson();
        context.Response.Write(orgJson);
    }
    
    public string GetOrgJson()
    {
        JsonTree result = new JsonTree();
        JsonTreeItem item = new JsonTreeItem();
        item.id = "1";
        
        item.name = item.DeptName;
        
        result.rows.Add(item);

        item = new JsonTreeItem();
        item.id = "11";
        item.name = item.DeptName;
        item._parentId = "1";
        result.rows.Add(item);

        item = new JsonTreeItem();
        item.id = "111";
        item.name = item.DeptName; ;
        item._parentId = "11";      
        result.rows.Add(item);

        item = new JsonTreeItem();
        item.id = "2";
        item.name = item.DeptName;
        
        result.rows.Add(item);

        item = new JsonTreeItem();
        item.id = "21";
        item.name = item.DeptName;
        item._parentId = "2";
        result.rows.Add(item);

        item = new JsonTreeItem();
        item.id = "211";
        item.name = item.DeptName;
        item._parentId = "21";
        result.rows.Add(item);

        result.total = result.rows.Count;
        return Newtonsoft.Json.JsonConvert.SerializeObject(result.rows);
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}