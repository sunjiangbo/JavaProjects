<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>编辑运维机构</title>
		<link href="<%=path%>/css/page.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.js">
		</script>

		<script type="text/javascript">
//重置表单
function resetForm() {
	document.getElementById("formMessage").innerHTML = "";
	document.basicInfoForm.reset();
}

// 验证电话号码
function validateTel(input) {
	var myReg = /^(([0\+]\d{2,3}-{0,1})?(0\d{2,3})-{0,1})?(\d{7,8})(-(\d{3,}))?$/;
	if (myReg.test(input)) {
		return true;
	}
	return false;
}

// 验证手机号码
function validateMobile(input) {
		var tmp = /^1[3-9]\d{9}$/; //11位手机号码验证
		if (!tmp.test(input)) {
			return false;
		}
		return true;
	}

	//验证表单
	function checkForm() {
	    if (document.getElementById("orgname").value == null
				|| document.getElementById("orgname").value == "") {
			document.getElementById("formMessage").innerHTML = "单位名称不能为空！";
			return;
		}else if(!validateTel(document.getElementById("telphone").value)&&!validateTel(document.getElementById("telphone").value)){
			document.getElementById("formMessage").innerHTML = "联系电话不符合要求！";
			return;
		}else if(!validateMobile(document.getElementById("cellphone").value)){
			document.getElementById("formMessage").innerHTML = "联系手机不符合要求！";
			return;
		}else if(document.getElementById("selectAreaId").value==0){
		    document.getElementById("formMessage").innerHTML = "必须选择所属省份和城市！";
			return;
		}
		document.editInfoForm.submit();
	}
				
</script>
	</head>
	<body>
		<div class="container_top">
			<span class="c_t_l"></span><span class="c_t_r"></span>
			<img src="<%=path%>/images/tb.gif" width="16" height="16" />
			你当前的位置：[运维用户管理 > 编辑运维结构]
		</div>
		<form method="post" action="Admin_saveYunweiInfo" id="form1"
			name="editInfoForm">
			<div class="content">
				<ul class="newobj">
					<li>
						<a href="#">&nbsp;</a>
					</li>
					<li class="sel">
						<a href="#">编辑运维机构</a>
					</li>
					<li class="gray">
						&nbsp;
					</li>
				</ul>

				<div class="cont90">
					<h6>
						运维基本资料
					</h6>
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="inputtable">
						<tr>
							<th scope="row">
								单位名称：
							</th>
							<td>
								<input id="orgname" type="text" size="50"
									value="<s:property value="yunwei.name" />" name="yunwei.name"
									maxlength="30" />
							</td>
						</tr>
						<tr>
							<th scope="row">
								联系电话：
							</th>
							<td>
								<input id="telphone" type="text" size="50"
									value="<s:property value="yunwei.telephone" />"
									name="yunwei.telephone" maxlength="20" />
							</td>
						</tr>
						<tr>
							<th scope="row">
								联系人：
							</th>
							<td>
								<input type="text" size="50"
									value="<s:property value="yunwei.linkman" />"
									name="yunwei.linkman" maxlength="20" />
							</td>
						</tr>
						<tr>
							<th scope="row">
								联系手机：
							</th>
							<td>
								<input id="cellphone" type="text" size="50"
									value="<s:property value="yunwei.cellphone" />"
									name="yunwei.cellphone" maxlength="20" />
							</td>
						</tr>
						<tr>
							<th scope="row">
								所属地区：
							</th>
							<td>
								<select id="provinceId">
									<s:iterator value="areas" var="area">
										<option value="<s:property value="#area.areaId" />"
											<s:if
												test="yunwei.TArea.TArea.areaId==#area.areaId">selected</s:if>>
											<s:property value="#area.name" />
										</option>
									</s:iterator>
								</select>

								<select name="selectAreaId" id="selectAreaId">
								</select>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td align="left">
								<label id="formMessage" style="color: red;">
									<s:property value="#request.result" />
								</label>
							</td>
						</tr>
					</table>
				</div>
				<table border="0" class="btn_table">
					<tr>
						<td>
							<a href="#" class="cssbtn" onclick="checkForm()"><img
									src="<%=path%>/images/save.gif" />保存</a>
							<a href="<s:url action="Admin_yunweiManager?pageIndex=1"></s:url>"
								class="cssbtn"><img src="<%=path%>/images/search.gif" />查看</a>
						</td>
					</tr>

				</table>
			</div>
		</form>
		<div class="container_bottom">
			<span class="c_b_l"></span><span class="c_b_r"></span>
		</div>
		<script type="text/javascript">
var provinceId = $("select[id='provinceId'][@selected]").val();
$.ajax( {
	type : "POST",
	url : "AreaAjax?provinceId=" + provinceId,
	dataType : "json",
	success : function(json) {
		for (i = 0; i < json.cities.length; i++) {
			var city = json.cities[i];
			if (city.areaId != <s:property value="yunwei.TArea.areaId" />) {
				$('#selectAreaId').append(
						"<option value='" + city.areaId + "'>" + city.name
								+ "</option>");
			}else{
			$('#selectAreaId').append(
						"<option value='" + city.areaId + "' selected  >" + city.name
								+ "</option>");
			}
		}
	},
	error : function(json) {
		alert("error:json=" + json);
		return false;
	}
});
$("#provinceId").change(
		function() {
			var provinceId = $("select[id='provinceId'][@selected]").val();
			$.ajax( {
				type : "POST",
				url : "AreaAjax?provinceId=" + provinceId,
				dataType : "json",
				success : function(json) {
					$("#selectAreaId").empty();
					$('#selectAreaId').append(
							"<option value='0'>--请选择城市--</option>");
					for (i = 0; i < json.cities.length; i++) {
						var city = json.cities[i];
						$('#selectAreaId').append(
								"<option value='" + city.areaId + "'>"
										+ city.name + "</option>");
					}
				},
				error : function(json) {
					alert("页面异常，请刷新页面");
					return false;
				}
			});
		});
</script>
	</body>
</html>
