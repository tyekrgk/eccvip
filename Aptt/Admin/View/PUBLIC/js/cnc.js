// JavaScript Document
function doo(d){
	document.getElementById(d).style.display="block";
}

function dmo(d){
	document.getElementById(d).style.display="none";
}

function GetRequest() {
   var url = location.search; //获取url中"?"符后的字串
   var theRequest = new Object();
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0; i < strs.length; i ++) {
         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
      }
   }
   return theRequest;
}

function trim(str){ //删除左右两端的空格
　return str.replace(/(^\s*)|(\s*$)/g, "");
}

function ncx(a,num,num1){
	b=document.getElementById('number').value;
	if(a){
		b++;	
	}else{
		b--;
	}
	if(b<0) b=0;
	if(b>num) b=num;
	if(b>num1) b=num1;
	document.getElementById('number').value=b;
}

// JavaScript Document
function navList(id) {
    var $obj = $("#J_navlist"), $item = $("#J_nav_" + id);
    $item.addClass("on").parent().removeClass("none").parent().addClass("selected");
    $obj.find("h4").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });
    $obj.find("p").hover(function () {
        if ($(this).hasClass("on")) { return; }
        $(this).addClass("hover");
    }, function () {
        if ($(this).hasClass("on")) { return; }
        $(this).removeClass("hover");
    });
    $obj.find("h4").click(function () {
        var $div = $(this).siblings(".list-item");
        if ($(this).parent().hasClass("selected")) {
            $div.slideUp(600);
            $(this).parent().removeClass("selected");
        }
        if ($div.is(":hidden")) {
            $("#J_navlist li").find(".list-item").slideUp(600);
            $("#J_navlist li").removeClass("selected");
            $(this).parent().addClass("selected");
            $div.slideDown(600);

        } else {
            $div.slideUp(600);
        }
    });
}