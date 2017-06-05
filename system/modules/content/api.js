

 //封装分页数据
        var pageTotal= {
                        current:1, //当前页
                        pageCount:9 , //每页显示的数据量
                        count : 0 ,//总数据量
                        total : 0 , //总共的页码
                        first : 1, //首页
                        last : 0 , //尾页
                        pre : 0, //上一页
                        next : 0 , //下一页        
                        getPages : function(){ //计算分页信息
                                pageTotal.total = Math.ceil(pageTotal.count / pageTotal.pageCount);
                                pageTotal.last = pageTotal.total ;
                                pageTotal.pre = pageTotal.current - 1 <= 0?1:(pageTotal.current - 1);
                                pageTotal.next = pageTotal.current + 1 >= pageTotal.total?pageTotal.total:(pageTotal.current + 1);
                        },
                        //获取数据
                        getDate: function(pageno,type){
                              
                                //清除content所有数据和元素
                                $("#data").empty();
                                if(pageno == null){
                                        pageno = 1;
                                }
                                //设置当前页
                                pageTotal.current = pageno;
                                pageTotal.count = _jsonData.length;
                                //设置每页显示的数据条数
                                pageTotal.pageCount = 9;
                                $("#data").append("<tr><th><strong>手机号</strong></td><th><strong>邀请码</strong></td><th><strong>所中奖项</strong></td><th><strong>日期</strong></td></tr>")
                                 //分页信息
                                itemNum= pageTotal.count >= (pageTotal.current)*(pageTotal.pageCount) ? (pageTotal.current)*(pageTotal.pageCount)  : pageTotal.count;
                                for(var i = (pageno-1)*pageTotal.pageCount ; i < itemNum ; i++){
                                       
                                        $("#data").append("<tr><td>"+_jsonData[i]["pwd_phone"]+"</td><td>"+_jsonData[i]["couponsn"]+"</td><td>"+_jsonData[i]["c_jiang_name"]+"</td><td>"+_jsonData[i]["use_time"]+"</td></tr>");
                                }
                               
//                                //分页信息
//                                for(var i = (pageno-1)*pageTotal.pageCount ; i < ((pageTotal.current)*(pageTotal.pageCount)) ; i++){
//                                        $("#uldata").append(_jsonData[i]);
//                                }
                                //获取分页样式
                                pageTotal.page(type); //type表示分页栏样式
                        },
                        page : function(type){
                                //清除分页栏元素
                                $("#page").empty();
                             
                                //填充分页样式欠要加载分页数据
                                pageTotal.getPages();
                                if(type == 2){
                                        
                                        var x = 6;
                                        //设置上下页
                                        $("#page").append(pageTotal.current+"/"+pageTotal.total+"&nbsp;&nbsp;&nbsp;<a href='javascript:pageTotal.getDate(1,"+type+");'>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;");
                                        var index = pageTotal.current <=Math.ceil(x/2)?1:(pageTotal.current)>=pageTotal.total-Math.ceil(x/2)?pageTotal.total-x:(pageTotal.current-  Math.ceil(x/2));
                                        var end = pageTotal.current <= Math.ceil(x/2)?(x+1):(pageTotal.current+Math.ceil(x/2))>=pageTotal.total?pageTotal.total:(pageTotal.current+Math.ceil(x/2));
                                        for(var i = index ; i < end ; i++){
                                                if(i == pageTotal.current){
                                                        $("#page").append("<a href='javascript:pageTotal.getDate("+pageTotal.current+","+type+");' class='on'>"+i+"</a>");
                                                }else{
                                                        $("#page").append("<a href='javascript:pageTotal.getDate("+i+","+type+");'>"+i+"</a>");
                                                }
                                        }
                                        if(end != pageTotal.total){
                                                $("#page").append("&nbsp;&nbsp;&nbsp;&nbsp;<span>...</span>");
                                        }
                                        $("#page").append("&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:pageTotal.getDate("+pageTotal.last+","+type+");'>尾页</a>");
                                }
                                if(type ==1){
                                        if(pageTotal.count){
                                                //设置上下页

                                            $("#page").append(pageTotal.current+"/"+pageTotal.total+"&nbsp;&nbsp;&nbsp;<a href='javascript:pageTotal.getDate(1,"+type+");'>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;");
                                            index=1;
                                            end=pageTotal.total
                                            for(var i = index ; i <= end ; i++){
                                                    if(i == pageTotal.current){
                                                            $("#page").append("<a href='javascript:pageTotal.getDate("+pageTotal.current+","+type+");' class='on'>"+i+"</a>");
                                                    }else{
                                                            $("#page").append("<a href='javascript:pageTotal.getDate("+i+","+type+");'>"+i+"</a>");
                                                    }
                                            }
                                            if(end != pageTotal.total){
                                                    $("#page").append("&nbsp;&nbsp;&nbsp;&nbsp;<span>...</span>");
                                            }
                                            $("#page").append("&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:pageTotal.getDate("+pageTotal.last+","+type+");'>尾页</a>");
                                        }
                                        
                                }
                        }
        };
  function Inquery(){
	    
          
		var queryData = { "phone": $('#phone').val(), 'couponsn': $('#couponsn').val() };
		$.ajax({  
			url: 'index.php?m=content&c=api&f=getWiningInfo' ,  
			type: 'GET', 	
			data: queryData,
			dataType: "json",
			async: false,  
			success: function (data) {  
				//document.getElementById("uldata").innerHTML= data;
				_jsonData = data;
				
				pageTotal.getDate(1,1);
			},
						
			error: function (returndata) {  
				//alert(returndata);  
			}  
		});
	
	
}
$(function(){
   
        Inquery();
	$(".cxan").click(function(){
             
		Inquery();
	});
})
