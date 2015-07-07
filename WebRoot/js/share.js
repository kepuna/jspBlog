/**
 * Created by user on 22/4/2015.
 */
var ShareTip = function(){}
//分享到腾讯微博
ShareTip.prototype.sharetoqq=function(content,url,picurl){	
    var shareqqstring='http://v.t.qq.com/share/share.php?title='+content+'&url='+url+'&pic='+picurl;
    window.open(shareqqstring,'newwindow','height=100,width=100,top=100,left=100');
}
//分享到新浪微博
ShareTip.prototype.sharetosina=function(title,url,picurl){
    var sharesinastring='http://v.t.sina.com.cn/share/share.php?title='+title+'&url='+url+'&content=utf-8&sourceUrl='+url+'&pic='+picurl;
	window.open(sharesinastring,'newwindow','height=100,width=100,top=100,left=100');
}
//分享到QQ空间
ShareTip.prototype.sharetoqqzone=function(title,url,picurl){
    var shareqqzonestring='http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?summary='+title+'&url='+url+'&pics='+picurl;
    window.open(shareqqzonestring,'newwindow','height=400,width=400,top=100,left=100');
}
var share=new ShareTip();



