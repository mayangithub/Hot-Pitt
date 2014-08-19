// JavaScript Document
/*Dynamic Rate JS*/

var pRate = function(box,callBack){
	this.Index = null;
	var B = $("#"+box),
		rate = B.children("i"),
		w = rate.width(),
		n = rate.length,
		me = this;
	for(var i=0;i<n;i++){
		rate.eq(i).css({
			'width':w*(i+1),
			'z-index':n-i
		});
	}	
	rate.hover(function(){
		var S = B.children("i.select");
		$(this).addClass("hover").siblings().removeClass("hover");
		if($(this).index()>S.index()){
			S.addClass("hover");
		}
	},function(){
		rate.removeClass("hover");
	})
	rate.click(function(){
		rate.removeClass("select hover");
		$(this).addClass("select");
		me.Index = $(this).index() + 1;
		if(callBack){callBack();}
	})
}
