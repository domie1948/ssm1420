<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<%@ include file="../../static/head.jsp" %>
	<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
		  rel="stylesheet">
	<script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
	</script>
	<script type="text/javascript" charset="utf-8"
			src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
			src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8"
			src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
	.error {
		color: red;
	}
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
	<div class="spinner">
		<div class="double-bounce1"></div>
		<div class="double-bounce2"></div>
	</div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
	<!-- Page Content -->
	<div id="content">
		<!-- Top Navigation -->
		<%@ include file="../../static/topNav.jsp" %>
		<!-- Menu -->
		<div class="container menu-nav">
			<nav class="navbar navbar-expand-lg lochana-bg text-white">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="ti-menu text-white"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul id="navUl" class="navbar-nav mr-auto">

					</ul>
				</div>
			</nav>
		</div>
		<!-- /Menu --><!-- /Breadcrumb -->
		<!-- Main Content -->
		<div class="container" style="width: 500px">

			<div class="row" center>
				<!-- Widget Item -->
				<div class="col-md-12">
					<div class="widget-area-2 lochana-box-shadow">
						<h3 class="widget-title" style="margin-left: 195px">注册</h3>
						<form id="register">
							<div class="form-row">
								<div class="form-group col-md-12" >
									<label>账户</label>
									<input id="account" name="account" class="form-control"
										   placeholder="账户">
								</div>
								<div class="form-group col-md-12">
									<label>密码</label>
									<input id="mima" name="mima" class="form-control"
										   placeholder="密码">
								</div>
								<div class="form-group col-md-12">
									<label>姓名</label>
									<input id="xingming" name="xingming" class="form-control"
										   placeholder="真实姓名">
								</div>
								<div class="form-group col-md-12">
									<label>录取通知单编码</label>
									<input id="notificationCode" name="notificationCode" class="form-control"
										   placeholder="录取通知单编码">
								</div>
								<div class="form-group col-md-12">
									<label>性别</label>
									<select id="sexTypesSelect" name="sexTypes" class="form-control">
									</select>
								</div>
								<div class="form-group col-md-12">
									<label>年龄</label>
									<input id="age" name="age" class="form-control"
										   onchange="ageChickValue(this)"  placeholder="年龄">
								</div>

								<div class="form-group col-md-12">
									<label>电话</label>
									<input id="phone" name="phone" class="form-control"
										   onchange="iphoneChickValue(this)" placeholder="电话">
								</div>
								<div class="form-group col-md-12">
									<label>邮箱</label>
									<input id="email" name="email" class="form-control"
										   onchange="emailChickValue(this)" placeholder="邮箱">
								</div>
								<div class="form-group col-md-12">
									<label>照片</label>
									<img id="portraitPhotoImg" src="" width="100" height="100">
									<input name="file" type="file" id="portraitPhotoupload"
										   class="form-control-file">
									<input name="portraitPhoto" id="portraitPhoto-input" type="hidden">
								</div>
								<div class="form-group col-md-12">
									<button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
									<button id="submitBtn" type="button" class="btn btn-primary btn-lg">注册</button>
								</div>
							</div>
						</form>

				</div>
				<!-- /Widget Item -->
			</div>
		</div>
		<!-- /Main Content -->
	</div>
	<!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
	<span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "xuesheng";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};

    var sexTypesOptions = [];
    var reportTypesOptions = [];
    var collegeTypesOptions = [];
    var majorTypesOptions = [];
    var clazzTypesOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {
        $('#portraitPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= baseUrl + 'file/download?fileName=' + data.result.file;
                document.getElementById('portraitPhotoImg').setAttribute('src',photoUrl);
                document.getElementById('portraitPhoto-input').setAttribute('value',photoUrl);
            }
        });
    }

    // 表单提交
    function submit() {

        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#register').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            httpJson("xuesheng/register", "POST", data, (res) => {
                if(res.code == 0
        )
            {
                window.sessionStorage.removeItem('id');
                if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                    window.sessionStorage.removeItem('onlyme');
                    window.location.href="../../login.jsp";
                } else {
                    window.location.href ="../../login.jsp";
                }

            }
        })
            ;
        } else {
            alert("表单未填完整或有错误");
        }
    }

    //查询当前页面下所有列表
    function sexTypesSelect() {
        //填充下拉框选项
        http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
            if(res.code == 0){
            sexTypesOptions = res.data.list;
        }
    });
    }

    //初始化下拉框
    function initializationSextypesSelect(){
        var sexTypesSelect = document.getElementById('sexTypesSelect');
        for (var i = 0; i < sexTypesOptions.length; i++) {
            sexTypesSelect.add(new Option(sexTypesOptions[i].indexName,sexTypesOptions[i].codeIndex));
        }
    }
    // 下拉框选项回显
    function setSelectOption() {
        for (var i = 0; i < sexTypesOptions.length; i++) {
            if(sexTypesOptions[i].codeIndex == ruleForm.sexTypes){//下拉框value对比,如果一致就赋值汉字
                document.getElementById("sexTypesSelect").options[i].selected = true;
            }
        }
    }


    // 填充富文本框
    function setContent() {
    }

    // 获取富文本框内容
    function getContent() {

    }

    //搜素输入检查
    function ageChickValue(e){
        var this_val = e.value || 0;
        var reg=/^[0-9]*$/;
        if(!reg.test(this_val)){
            e.value = "";
            alert("输入不合法");
            return false;
        }
    }

    function iphoneChickValue(e){
        var this_val = e.value || 0;
        var reg=/^1[3|4|5|7|8][0-9]{9}$/;
        if(!reg.test(this_val)){
            e.value = "";
            alert("请输入正确的手机号码");
            return false;
        }
    }

    function emailChickValue(e){
        var this_val = e.value || 0;
        var reg=/^[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*\.[a-z]{2,}$/;
        if(!reg.test(this_val)){
            e.value = "";
            alert("请输入正确的邮箱");
            return false;
        }
    }

    function exit() {
        window.sessionStorage.removeItem("id");
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#register").validate({
            rules: {
                account: "required",
                mima: "required",
                xingming: "required",
                notificationCode: "required",
                sexTypes: "required",
                age: "required",
                phone: "required",
                email: "required",
                portraitPhoto: "required",
            },
            messages: {
                account: "账户不能为空",
                mima: "密码不能为空",
                xingming: "姓名不能为空",
                notificationCode: "证书不能为空",
                sexTypes: "性别不能为空",
                age: "年龄不能为空",
                phone: "手机号不能为空",
                email: "邮箱不能为空",
                portraitPhoto: "图片不能为空",
            }
        }).form();
    }
    //图片显示
    function showImg() {
        $("#portraitPhotoImg").attr("src",ruleForm.portraitPhoto);
    }


    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        })
        //查询当前页面所有下拉框
        sexTypesSelect();

        // 初始化下拉框
        initializationSextypesSelect();



        setSelectOption();
        // 设置图片src
        showImg();
        // 富文本框回显
        setContent();
        //注册表单验证
        $(validform());

        //初始化上传按钮
        upload();
        <%@ include file="../../static/myInfo.js"%>
        $('#submitBtn').on('click', function (e) {
            e.preventDefault();
            //console.log("点击了...提交按钮");
            submit();
        });
        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') != '管理员') {
            $('#jifen').attr('readonly', 'readonly');
            //$('#money').attr('readonly', 'readonly');
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>