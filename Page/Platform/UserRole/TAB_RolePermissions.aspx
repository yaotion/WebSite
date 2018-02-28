<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="UserRole_TAB_RolePermissions, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function setvalue() {
            var str = ""
            $('[name=items]:checkbox:checked').each(function() {
                str += $(this).val() + ",";
            });
            if (str != "") {
                str = cutcomma(str, 1, ',');
                $("#<%=hfid.ClientID%>").val(str);
                return true;
            }
            else {
                $.messager.alert('提示:', "请保留至少一个权限");
                return false;
            }
        }
        $(function() {
            for (var i = 1; i < 12; i++) {
                if ($("#dt" + i).next("dd").find("[name=items]:checkbox").filter(':checked').length != 0) {
                    $("#dt" + i).find("input[type='checkbox']").attr('checked', true);
                }
            }
            $("dl dt input[type='checkbox']").click(function() {
                var cb = $(this).parent().next("dd").find("ul li [name=items]:checkbox");
                cb.attr('checked', this.checked);
            });
            $("dl dd ul li input[type='checkbox']").click(function() {
                var cb = $(this).parent().parent().parent().prev().find("input[type='checkbox']");
                if ($(this).parent().parent().find("[name=items]:checkbox").filter(':checked').length == 0) {
                    cb.attr('checked', false);
                }
                else {
                    cb.attr('checked', true);
                }
            });
        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfid" runat="server"></asp:HiddenField>
    <div style="width: 526px; height: 480px;">
        <div style="border-bottom: solid 1px #E8E8E8; height: 31px;">
            <div style="float: right;">
                <asp:Button ID="btnSaveSort" runat="server" Text="保存" Width="80" OnClientClick="return setvalue();"
                    OnClick="btnSaveSort_Click" />
            </div>
        </div>
        <div style="width: 526px; height:480px; overflow:auto;">
            <%
                int nItemIndex = 0;
                if (NodeValues != null)
                {
                    System.Data.DataRow[] FirstModuleRows = NodeValues.Select("nParentID=1");
                    for (int i = 0; i < FirstModuleRows.Length; i++)
                    {
                        nItemIndex += 1;
            %>
            <div class="c"></div>
            <div style=" float:left; width: 505px;margin-left:1px; margin-top:1px;">
                    <dl >
                        <dt id="dt<%=nItemIndex %>" style="width: 496px; padding-left:10px; height: 35px; line-height: 40px;
                            background-color: #5d5d5d; color: White; vertical-align: middle;
                            font-size: 14px; text-align: left;">
                            <input type="checkbox" name="items" value='<%=FirstModuleRows[i]["nID"].ToString()%>' /><%=FirstModuleRows[i]["strUrlDescription"].ToString()%></dt>
                        
                        <dd>
                            <ul>
                                
                                <%
                                    System.Data.DataRow[] SecondModuleRows = NodeValues.Select("nParentID=" + FirstModuleRows[i]["nID"].ToString());
                                    foreach (System.Data.DataRow SecondSortRow in SecondModuleRows)
                                    {
                                        %>
                                        <li style=" clear:both; width: 501px; height: 25px; padding-left: 5px; line-height: 30px; vertical-align: middle;
                                    text-align: left; color: #1c94c4; background-color:#E3E3E3;">
                                    <input type="checkbox" name="items" value='<%=SecondSortRow["nID"].ToString()%>' />
                                    <%=SecondSortRow["strUrlDescription"].ToString()%></li>
                                        <%
                                        System.Data.DataRow[] ThirdRows = NodeValues.Select("nParentID=" + SecondSortRow["nID"].ToString());
                                        foreach (System.Data.DataRow ModuleRow in ThirdRows)
                                        {
                                %>
                                <li style="float: left; list-style:none; width: 110px; height: 25px; padding-left: 5px; line-height: 30px; vertical-align: middle;
                                    text-align: left;">
                                    <input type="checkbox" name="items" value='<%=ModuleRow["nID"].ToString()%>' />
                                    <%=ModuleRow["strUrlDescription"].ToString()%></li>
                                <%}
                                    }
                                %>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <%}
                }
                %>
            </div>
        </div>
</asp:Content>
