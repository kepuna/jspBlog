<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zj.blog.model.*" %>
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
	</head>
<body>
<jsp:include page="include_header.jsp"></jsp:include>
<!--博文信息内容-->
<% 
BlogBean currentBlog,prevBlog,nextBlog;	
prevBlog = (BlogBean)request.getAttribute("prevBlog"); 
currentBlog = (BlogBean)request.getAttribute("currentBlog"); 		
nextBlog = (BlogBean)request.getAttribute("nextBlog");
List commentList = (List)request.getAttribute("commentList");
CommentBean cb = null;
String commentSize = (String)request.getAttribute("commentSize");
%>
<div class="container blogDetail-container clearfix">

    <div class="article-infor fl">
        <article >
            <h2 class="article-title">[<%=currentBlog.getTitle() %>]</h2>
            <h3 class="date"><%=currentBlog.getCreatedTime() %></h3>
            <div class="article-content"><%=currentBlog.getContent() %></div>
            <hr>
            <div class="article-share">
                <span>分享到：</span>
                <a class="share-qzone" href="javascript:void(0);" title="分享到空间" onclick="share(1);" target="_blank"></a>
                <a class="share-xinlang" href="javascript:void(0);" title="分享到新浪微博" onclick="share(2);" target="_blank" ></a>
                <a class="share-weixin" href="javascript:void(0);" title="分享到腾讯微博" onclick="share(3);" target="_blank"></a>
                
                <p>如需转载，烦请注明出处：
                    <a id="reprint" onclick="UrlSearch();"></a>
                </p>
            </div>
            <div class="anotrer-article">
            	<%
            	if(prevBlog != null){
            	 %>
                <h3>上一篇: <a href="servlet/ShowBlogServlet?type=blog&blogId=<%=prevBlog.getId() %>"><%=prevBlog.getTitle() %></a>
                <%
                }
                if(nextBlog != null){
                 %>
                 | 下一篇: <a href="servlet/ShowBlogServlet?type=blog&blogId=<%=nextBlog.getId() %>"><%=nextBlog.getTitle() %></a>
                 <%
                 }
                  %>
                 </h3>
            </div>
            <div class="comment">发表评论（<%=commentSize %> 条）</div><hr>
            <!--评论的列表-->
 <%
    if(commentList != null){ 
    	for(int i=0;i<commentList.size();i++){
    		cb = (CommentBean)commentList.get(i);
%>
            <div class="comments-list">
                <ul class="comments-list">
                    <li>
                        <h6 class="comment-name">
                            <%=cb.getUsername() %>
                            <span class="comment-time"><%=cb.getCreatedTime() %></span>
                        </h6>
                        <!--评论内容-->
                        <div class="comment-content">
 							<%=cb.getContent() %>
                        </div>

                    </li>
                </ul>
            </div>
  <%
   	 }
    } 
    %>
       <div class="comment-form" >
           <form  method="post" action="servlet/ShowBlogServlet?type=comment&blogId=<%=currentBlog.getId() %>">
               <input name="name" type="text" placeholder="昵 称..." />
               <textarea name="commentContent" placeholder="请留下您的足迹..."></textarea>
               <input class="button"type="submit" name="button" value="提交" />
               <input class="button" type="reset" name="button" value="重置" />
           </form>
       </div>
     </article>
    </div><!--左边博客内容区域-->
    <div class="rightBar fl">
        <h3 class="my-info">个人资料</h3>
        <img class="my-pic" src="images/mypic.jpg" alt=""/>
        <p class="my-intro">
            郑佳，09年华中科技大学毕业，目前上海，现就职ISUX上海设计中心，热爱web前端，喜爱钓鱼。

            邮箱：zhangxinxu@zhangxinxu.com
            微博：新浪 腾讯(工作机会)
        </p>
    </div>
</div>




<!--底部区域-->
<jsp:include page="include_footer.jsp"></jsp:include>


<script src="js/jquery-2.1.1.js"></script>
<script src="js/login.js"></script>
<script src="js/share.js"></script>

<script>
window.onload = function(){
	UrlSearch();
}
function UrlSearch(){
	var reprint = document.getElementById("reprint");
	var str=location.href;
	reprint.href = str;
	reprint.innerHTML= str;

}
function shareTo(id) {
    var str = window.location.href;
    var newStr = escape(str);
    if(id == 1){
        share.sharetoqqzone('<%=currentBlog.getTitleIntro()%>',newStr,'http://tm.arcgismg/ShareBook.jpg');
    }
    else if(id == 2){
        share.sharetosina("<%=currentBlog.getTitleIntro()%>",newStr,"http://tm.arcgismg/ShareBook.jpg");
    }
    else if(id == 3){
        share.sharetoqq("<%=currentBlog.getTitleIntro()%>",newStr,"http://tm.arcgismg/ShareBook.jpg");
    }
}
  	

</script>

</body>
</html>
