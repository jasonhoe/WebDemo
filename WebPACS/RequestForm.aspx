<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestForm.aspx.cs" Inherits="WebPACS.RequestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查申请单</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div>
        <h2 style="text-align: center">彩超检查申请单</h2>
        <table class="table-bordered table">
            <tr>
                <td>姓名</td>
                <td></td>
                <td>性别</td>
                <td></td>
                <td>年龄</td>
                <td></td>
                <td>门诊号</td>
                <td></td>
                <td>住院号</td>
                <td></td>
            </tr>
            <tr>
                <td>科室</td>
                <td></td>
                <td>开单医生</td>
                <td></td>
                <td>床号</td>
                <td></td>
                <td>联系方式</td>
                <td></td>
                <td>开单时间</td>
                <td></td>
            </tr>
               <tr>
                <td>是否急诊</td>
                <td><select><option>未选择</option><option>是</option><option>否</option></select></td>
                <td>是否隔离</td>
                <td><select><option>未选择</option><option>是</option><option>否</option></select></td>
                <td>多耐病人</td>
                <td><select><option>未选择</option><option>是</option><option>否</option></select></td>
                <td>传染病</td>
                <td><select><option>未选择</option><option>是</option><option>否</option></select></td>
                <td>开单时间</td>
                <td></td>
            </tr>
            <tr>
                <td>病情摘要</td>
                <td colspan="9"></td>
            </tr>
            <tr>
                <td>临床诊断</td>
                <td colspan="9"></td>
            </tr>
            <tr>
                <td>检查部位</td>
                <td colspan="9"></td>
            </tr>
            <tr>
                <td>检查目的</td>
                <td colspan="9"></td>
            </tr>
            <tr>
                <td>备注</td>
                <td colspan="9"></td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <input type="button" value="保存" /></div>
</body>
</html>
