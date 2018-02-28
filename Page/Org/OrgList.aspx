<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Org_OrgList, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <script type="text/javascript">
       function convert(rows) {
           function exists(rows, parentId) {
               for (var i = 0; i < rows.length; i++) {
                   if (rows[i].id == parentId) return true;
               }
               return false;
           }

           var nodes = [];
           // get the top level nodes
           for (var i = 0; i < rows.length; i++) {
               var row = rows[i];
               if (!exists(rows, row.parentId)) {
                   nodes.push({
                       id: row.id,
                       text: row.name
                   });
               }
           }

           var toDo = [];
           for (var i = 0; i < nodes.length; i++) {
               toDo.push(nodes[i]);
           }
           while (toDo.length) {
               var node = toDo.shift();	// the parent node
               // get the children nodes
               for (var i = 0; i < rows.length; i++) {
                   var row = rows[i];
                   if (row.parentId == node.id) {
                       var child = { id: row.id, text: row.name };
                       if (node.children) {
                           node.children.push(child);
                       } else {
                           node.children = [child];
                       }
                       toDo.push(child);
                   }
               }
           }
           return nodes;
       }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<h2>Basic TreeGrid</h2>
	<p>TreeGrid allows you to expand or collapse group rows.</p>
	<div style="margin:20px 0;"></div>
    <div id="tt">
        </div>
       <script type="text/javascript">
           $('#tt1').tree({
               url: 'ashx/OrgList.ashx',
               loadFilter: function (rows) {
                   alert(rows);
                   return convert(rows);
               }
           });


           $(function () {
               $('#tt').treegrid({
                   url: 'ashx/OrgList.ashx',
                   method: 'post',          //请求方式
                   idField: 'id',           //定义标识树节点的键名字段
                   treeField: 'name',       //定义树节点的字段
                   fit: true,               //网格自动撑满
                   fitColumns: true,        //设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。
                   columns: [[
                       { field: 'name', title: '名称', width: 100 },
                       { field: '_parentId', title: '所属父级', width: 100 },
                   ]]
               });
           });
    </script>
</asp:Content>