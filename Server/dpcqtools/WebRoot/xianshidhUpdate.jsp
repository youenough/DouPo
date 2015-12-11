<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String id = request.getParameter("id");
	String countLimit = request.getParameter("countLimit");
	String costItem = request.getParameter("costItem");
	costItem = new String(costItem.getBytes("iso-8859-1"), "utf-8");
	String getItem = request.getParameter("getItem");
	getItem = new String(getItem.getBytes("iso-8859-1"), "utf-8");
%>

<script type="text/javascript">

	//更新限时英雄奖励
	function update() {
		var id = $("#id").val();
		var countLimit = $("#countLimit").val();
		var costItem = $("#costItem").val();
		var getItem = $("#getItem").val();
		var thingCode = $("#thingCode").val();
		var thingCode2 = $("#thingCode2").val();
		var url;
		var message;
		url = "activities!updateExchangeList.action";
		$.get(url, {
			id : id,
			thingCode : thingCode,
			thingCode2 : thingCode2,
			costItem : costItem,
			getItem : getItem,
			countLimit : countLimit
		}, function(data) {
			var dataObj=eval("("+data+")");
			if (dataObj == null) {
				alert('更新失败');
				return;
			}
			alert(dataObj);
			if (dataObj == '操作成功') {
				$("#right_content").load("xianshidh.jsp",function(){$("#right_content").fadeIn(100);});
			}
		});
	}
	
	//打开选择物品子窗口
	var w;//open 窗口对象
	var wTimer;//计时器变量, 监听窗口关闭
	function openThingWindow () {
		  var url = 'goods!selectThing.action';//转向网页的地址;
		 // var url = 'test.jsp';//转向网页的地址;
		  var name;//网页名称，可为空;
		  var iWidth = 625;//弹出窗口的宽度;
		  var iHeight = 485;//弹出窗口的高度;
		  var iTop = (window.screen.availHeight-30-iHeight)/2;//获得窗口的垂直位置;
		  var iLeft = (window.screen.availWidth-10-iWidth)/2;//获得窗口的水平位置;
		  w = window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
		  if (w) {
		    window.w.focus();//判断窗口是否打开,如果打开,窗口前置
		  }
		  wTimer=window.setInterval("wisclosed()",200);
	}

	//监听字窗口是否关闭
	function wisclosed(){
		  if(w.closed){
			    window.clearInterval(wTimer);
			    $("#costItem").val(window.thingName);
			    $("#thingCode").val(window.thingCode);
		  }
	}
	
	function openThingWindow2 () {
		  var url = 'goods!selectThing.action';//转向网页的地址;
		 // var url = 'test.jsp';//转向网页的地址;
		  var name;//网页名称，可为空;
		  var iWidth = 625;//弹出窗口的宽度;
		  var iHeight = 485;//弹出窗口的高度;
		  var iTop = (window.screen.availHeight-30-iHeight)/2;//获得窗口的垂直位置;
		  var iLeft = (window.screen.availWidth-10-iWidth)/2;//获得窗口的水平位置;
		  w = window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
		  if (w) {
		    window.w.focus();//判断窗口是否打开,如果打开,窗口前置
		  }
		  wTimer=window.setInterval("wisclosed2()",200);
	}

	//监听字窗口是否关闭
	function wisclosed2(){
		  if(w.closed){
			    window.clearInterval(wTimer);
			    $("#getItem").val(window.thingName);
			    $("#thingCode2").val(window.thingCode);
		  }
	}
	
</script>


<form id='from1' name='from1' onload="">

	
	<h2>修改限时英雄积分奖励</h2>
	
	<dl>
		<dt>
			<label for="email">编号</label>
		</dt>
		<dd>
		    <input type="text" id='id' name='id' value="<%=id%>"  readonly/> 
		</dd>
	</dl>
		<dl>
		<dt>
			<label for="email">消耗道具(可多个)</label>
		</dt>
		<dd>
		<textarea id="costItem" name="costItem" style="width:250px;height:120px;" onclick="openThingWindow()" readonly><%=costItem %></textarea>
			
		</dd>
	</dl>
		<dl>
		<dt>
			<label for="email">获得道具(可多个)</label>
		</dt>
		<dd>
		<textarea id="getItem" name="getItem" style="width:250px;height:120px;" onclick="openThingWindow2()" readonly><%=getItem %></textarea>
			
		</dd>
	</dl>
	<dl>
		<dt>
			<label for="email">最大兑换次数</label>
		</dt>
		<dd>
			<input id='countLimit' value="<%=countLimit%>" type="text" name='countLimit'>
		</dd>
	</dl>

	<input type="hidden" id='thingCode' name='thingCode'/> 
	<input type="hidden" id='thingCode2' name='thingCode2'/> 

	<a href="#" onclick="update()" class="bt_green"><span class="bt_green_lft"></span><strong>确定修改</strong><span class="bt_green_r"></span> </a>
		
</form>