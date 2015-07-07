<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zj.blog.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="_basepath.jsp" %>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Welcome to ZJ`s Website</title>
		<meta charset="utf-8">
		<link href="css/reset.css" rel='stylesheet' type='text/css' />
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/login.css" rel='stylesheet' type='text/css' />
		<link rel="stylesheet" href="css/music_player.css" type='text/css' />

		
	</head>
	<body>
		<!--包含头部-->
		<jsp:include page="include_header.jsp"></jsp:include>
		<div class="banner-big">
			<!--背景大图-->
			<pre class="top-header-info">
        Hello,
        I'm Zheng Jia.
        I wanna be a  UI / Web Designer.
    </pre>
			<!--<div class="contacts">
				<span class="line line-top"></span>
				<span class="line line-right"></span>
				<span class="line line-bottom"></span>
				<span class="line line-left"></span> CONTACT ME
			</div>-->
		</div>


		<!--博文列表-->
		<div class="container clearfix">
			<div class="article fl">
				<ul class="blog clearfix">
					<%
						List blogList = (List) request.getAttribute("blogList");
						List categoryList = (List) request.getAttribute("categoryList");
						String s_pageCount = (String) request.getAttribute("pageCount");
						String pageNow = (String) request.getAttribute("pageNow");// 为了实现上下翻页
						if (pageNow == null) {
							pageNow = "1";
						}
			
						int pageCount = Integer.parseInt(s_pageCount);
						BlogBean blog = null;
						CategoryBean category = null;
						for (int i = 0; i < blogList.size(); i++) {
							blog = (BlogBean) blogList.get(i);
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							String date = sdf.format(blog.getCreatedTime());
							SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
							String time = sdf2.format(blog.getCreatedTime());
					%>

					<li class="blog-item">
						<article>
						<div class="article-top-info">
							<ul class="article-top-info">
								<li>
									<img src="images/article-top-icon3.png" alt="" />
									<span id="categoryName<%=i%>"><%=blog.getName() %></span>
								</li>
								<li>
									<img src="images/blog-icon1.png" alt="" />
									<span id="date<%=i%>"><%=date%></span>
								</li>
								<li>
									<img src="images/blog-icon2.png" alt="" />
									<span id="time<%=i%>"><%=time%></span>
								</li>
								
							</ul>
						</div>
						<h2>
							
							<a
								href="servlet/ShowBlogServlet?blogId=<%=blog.getId()%>&type=blog"
								class="title" id="title<%=i%>"><%=blog.getTitle()%></a>
						</h2>
						<div class="title-intro" id="titleIntro<%=i%>"><%=blog.getTitleIntro()%></div>
						<a
							href="servlet/ShowBlogServlet?blogId=<%=blog.getId()%>&type=blog"
							class="article-detail" id="articleDetail<%=i%>">阅读全文</a>
						</article>
					</li>
					<%
						}
					%>

				</ul>
			</div>

			<!--右边侧栏内容区域-->
			<div class="right-content fr">
				<div class="search-box">
					<form method="post" action="">
						<input class="search-content" type="text" name="searchContent">
						<input class="search-btn" type="submit" value="搜索">
					</form>
				</div>
				<div class="article-category">
					<div class="article-category-title">
						<a href="servlet/ShowBlogServlet?type=blogList"
							style="color: #fff;">全部分类</a>
					</div>
					<div class="article-category-content">
						<ul class="article-category-content">
							<%
								if (categoryList != null) {
									for (int i = 0; i < categoryList.size(); i++) {
										category = (CategoryBean) categoryList.get(i);
							%>

							<li class="article-category-item">
								<a
									href="servlet/ShowBlogServlet?type=displayAsCategory&getCategoryId=<%=category.getId()%>"><span></span><%=category.getName()%></a>
							</li>
							<%
								}
								}
							%>
						</ul>
					</div>
				</div>
				<!--音乐播放器 -->
				<div id="music-player" class="clearfix">
					<div id="audio-img">
						<img class="cover" width="100%" height="105px">
					</div>
					<div class="audio-content">
						<div id="audio-info">
							<!--显示的时专辑人-->
							<!--显示的时歌曲的题目-->
							<span class="artist"></span>-
							<span class="title"></span>
						</div>
						<div id="audio-player">
							<!--音量调节-->
							<input id="volume" type="range" min="0" max="10" value="5">
							<br>
							<!--操作按钮-->
							<div id="audio-controls">
								<a id="prev" href="javascript:void(0);"></a>
								<a id="play" href="javascript:void(0);"></a>
								<a id="pause" href="javascript:void(0);"></a>
								<a id="next" href="javascript:void(0);"></a>
							</div>
							<ul id="playlist">
								<li class="active" song="yujian.mp3" cover="cover3.jpg"
									artist="孙燕姿">
									遇见.mp3
								</li>
								<li song="hongdou.mp3" cover="cover5.jpg" artist="方大同">
									红豆.mp3
								</li>
								<li song="huainian.mp3" cover="cover3.jpg" artist="孙燕姿">
									我怀念的.mp3
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="page" id="page"></div>
		<!--分页-->
		<!--回到顶部-->
		<div id="btnToTop"></div>
		<!--底部区域-->
		<jsp:include page="include_footer.jsp"></jsp:include>

<script src="js/jquery-2.1.1.js"></script>
<script src="js/musicplayer.js"></script>
<script src="js/login.js"></script>		
<script>
window.onload = function () {
     page({
         id:'page',
         nowNum:1,
         allNum:<%=pageCount%>,
         
     });
     backTop();
}
/*回到顶部的函数*/
function backTop() {
    var obtn = document.getElementById('btnToTop');
    var isTop = true;
    var timer = null;
//        滚动条滚动时触发该事件
//    获取可视区域的高度
    var clientHeight = document.documentElement.clientHeight || document.body.clientHeight;
   // var osTop = document.documentElement.scrollTop || document.body.scrollTop;
    window.onscroll = function () {
        var osTop = document.documentElement.scrollTop || document.body.scrollTop;
        if(osTop >= clientHeight){
            obtn.style.display = 'block';
        }else{
            obtn.style.display = 'none';
        }
        if(!isTop){
//                只有isTop为false时候，也就是!isTop 为true时，才会执行
            clearInterval(timer);
        }
        isTop = false;
    };
    obtn.onclick = function () {

        
//        是否滚回到顶部       
        timer = setInterval(function(){
            isTop = true;
            var osTop = document.documentElement.scrollTop || document.body.scrollTop;
            var moveSpeed = Math.floor(-osTop / 10);
            document.documentElement.scrollTop = document.body.scrollTop = osTop + moveSpeed;

            if(osTop === 0){
                clearInterval(timer);
            }
        },30);

    }
}
        
        
var req;
function page(opt){
     if(!opt.id){return false;}
     var obj = document.getElementById(opt.id);

     var nowNum = opt.nowNum || 1;
     var allNum = opt.allNum || 5;
     var callback = opt.callback || function () {};
     
     if(allNum >=6 && nowNum>=4){/*创建首页*/
         var oA = document.createElement('a');
         oA.href = "#1";
         oA.innerHTML = "首页";
         obj.appendChild(oA);
     }
     if(nowNum >=2){/*创建上一页*/
         var oA = document.createElement('a');
         oA.href = "#"+(nowNum-1);
         oA.innerHTML = "上一页";
         obj.appendChild(oA);
     }

     /*当总页数小于5的情况*/
     if(allNum<=5){
         for(var i=1;i<=allNum;i++){
             var oA = document.createElement('a');
             oA.href = "#"+i;
             /*区分当前页的样式*/
             if(nowNum == i){
                 oA.className = 'currentRed';
             } oA.innerHTML = i;
             obj.appendChild(oA);
         }
     }else{/*当总页数大于5的时候，页面显示的5页就和当前页数有关系了 */
         for(var i=1;i<=5;i++){
             var oA = document.createElement('a');
             if(nowNum==1 || nowNum==2){/*nowNum 等于1 或者2的情况，防止出现 -1，0 页数*/
                 oA.href = "#"+i;
                 if(nowNum == i){
                     oA.className = 'currentRed';
                 }
                 oA.innerHTML = i;
             }else if((allNum-nowNum) == 0 || (allNum-nowNum) == 1){
                 oA.href = "#"+(allNum-5+i);
                 if((allNum-nowNum) == 0 && i==5 || (allNum-nowNum) == 1 && i==4){
                     oA.className = 'currentRed';
                 }
                 oA.innerHTML = allNum-5+i;
             }else{/*nowNum大于等于3的情况*/
                 oA.href = "#"+(nowNum-3+i);

                 if(i == 3){
                    oA.className = 'currentRed';
                 }
                 oA.innerHTML = nowNum-3+i;
             }
             obj.appendChild(oA);
         }
     }
     if((allNum -nowNum )>=1){ //创建下一页
         var oA = document.createElement('a');
         oA.href = "#"+(nowNum+1);
         oA.innerHTML = "下一页";
         obj.appendChild(oA);
     }
     if((allNum -nowNum )>=3 && allNum >=6){ //尾页
         var oA = document.createElement('a');
         oA.href = "#"+(allNum);
         oA.innerHTML = "尾页";
         obj.appendChild(oA);
     }
            
/*为所有a标签添加点击事件*/
     var aA = obj.getElementsByTagName('a');
       for(var i=0;i<aA.length;i++){
           aA[i].onclick = function(){
            // 获取到当前点击的nowNUm
            var nowNum = parseInt(this.getAttribute('href').substring(1));
            var url = "servlet/ShowBlogServlet?type=page&pageNow="+nowNum;
            if(window.XMLHttpRequest) {  
				req = new XMLHttpRequest();  //IE7, Firefox, Opera支持  
			}else if(window.ActiveXObject) {  
				req = new ActiveXObject("Microsoft.XMLHTTP");  //IE5,IE6支持  
			}  
			req.open("GET",url,true);  
			req.onreadystatechange = clickPage;  
			req.send(null);
                
           obj.innerHTML = '';
            page({
                id:opt.id,
                nowNum:nowNum,
                allNum:allNum  
            });
            return false;// 阻止默认事件
           }
     } // for end
}
        
function clickPage(){
	if(req.readyState == 4 && req.status == 200) { 
	     	var jsonObj = eval("("+req.responseText+")");
	   		for(var i in jsonObj){
	   			document.getElementById('title'+i).innerHTML = jsonObj[i].blogTitle; 
	   			document.getElementById('title'+i).href = "servlet/ShowBlogServlet?type=blog&blogId=" +jsonObj[i].blogId;	
	   			document.getElementById('titleIntro'+i).innerHTML = jsonObj[i].blogTitleIntro;
		      	document.getElementById('articleDetail'+i).href = "servlet/ShowBlogServlet?type=blog&blogId=" +jsonObj[i].blogId;
		      	document.getElementById('date'+i).innerHTML = jsonObj[i].date;	
		      	document.getElementById('time'+i).innerHTML = jsonObj[i].time;
		      	document.getElementById('categoryName'+i).innerHTML = jsonObj[i].category;
	   		} 
	 }  
}      
</script>

</body>
</html>
