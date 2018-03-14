<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<!-- Set render engine for 360 browser -->
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- HTML5 shim for IE8 support of HTML5 elements -->
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/public/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
	<link href="/public/simpleboot/css/simplebootadmin.css" rel="stylesheet">
	<link href="/public/js/artDialog/skins/default.css" rel="stylesheet" />
	<link href="/public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- <link href="/admin/themes/simplebootx/Public/assets/css/jquery.minicolors.css" rel="stylesheet" /> -->
	<style>
		form .input-order {
			margin-bottom: 0px;
			padding: 3px;
			width: 40px;
		}

		.table-actions {
			margin-top: 5px;
			margin-bottom: 5px;
			padding: 0px;
		}

		.table-list {
			margin-bottom: 0px;
		}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
	<script type="text/javascript">
		//全局变量
		var GV = {
			ROOT: "/",
			WEB_ROOT: "/",
			JS_ROOT: "public/js/",
			APP: '<?php echo (MODULE_NAME); ?>'/*当前应用名*/
		};
	</script>
	<!-- <script src="/public/js/jquery.js"></script> -->
	<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>

	<link rel="stylesheet" href="/public/js/dist/css/bootstrap-select.css">
	<script src="/public/js/dist/js/bootstrap-select.js"></script>
	<style type="text/css">
		.bs-searchbox .form-control {
			width: 87%;
		}
	</style>

	<script src="/public/js/wind.js"></script>
	<!-- <script src="/public/simpleboot/bootstrap/js/bootstrap.min.js"></script> -->
	<!-- <script src="/admin/themes/simplebootx/Public/assets/js/jquery.minicolors.js"></script> -->

	<script>
		$(function () {
			$("[data-toggle='tooltip']").tooltip();
		});
	</script>
	<?php if(APP_DEBUG): ?><style>
			#think_page_trace_open {
				z-index: 9999;
			}
		</style><?php endif; ?>
</head>

<body>
	<div class="wrap js-check-wrap">
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="<?php echo U('Domain/domainindex');?>">域名列表</a>
			</li>
			<li>
				<a href="<?php echo U('Domain/domainadd');?>">添加域名</a>
			</li>
		</ul>
		<form class="well form-search" method="post" action="<?php echo U('Domain/domainindex');?>">
			<td>
				<select name="ipid" id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="--请选择IP--">
					<?php if(is_array($ipres)): $i = 0; $__LIST__ = $ipres;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>" <?php if($ipid==$vo[ 'id']) echo 'selected';?>><?php echo ($vo["ip"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</td>
			<input type="text" name="keyword" style="width: 200px;" value="<?php echo ($keyword); ?>" placeholder="请填写域名">&nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary">搜索</button>&nbsp;&nbsp;&nbsp;
			<a class="btn btn-danger" href="<?php echo U('Domain/domainindex');?>">清空</a>
			<b style="color: red;font-size: 0.7rem;margin-left: 2rem">注：域名请不要带“http://”搜索</b>
		</form>
		<table class="table table-hover table-bordered table-list">
			<thead>
				<tr>
					<th>解析IP</th>
					<th>域名</th>
					<th width="6%">是否加速</th>
					<th>备注</th>
					<th width="7%"><?php echo L('ACTIONS');?></th>
				</tr>
			</thead>
			<?php if(is_array($res)): foreach($res as $key=>$vo): ?><tr>
					<td><?php echo ($vo["ipid"]); ?></td>
					<td><?php echo ($vo["domain"]); ?></td>
					<td><?php echo ($vo["isspeed"]); ?></td>
					<td><?php echo ($vo["remark"]); ?></td>
					<td>
						<a href="<?php echo U('Domain/domainedit',array('id'=>$vo['id']));?>"><?php echo L('EDIT');?></a>&nbsp;&nbsp;|
						<a href="<?php echo U('Domain/domaindel',array('id'=>$vo['id']));?>"><?php echo L('DELETE');?></a>&nbsp;&nbsp;
					</td>
				</tr><?php endforeach; endif; ?>
		</table>
		<div class="pagination"><?php echo ($page); ?></div>
	</div>
	<script src="/public/js/common.js"></script>
	<script src="/public/js/xing.js" id="mymouse"></script>
</body>

</html>