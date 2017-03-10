function Xlist(o,x,l){//o是数据，结构为：{t:'ROOT',c[{t:'s1',c:[]},{t:'s2':c[]}]}
	var root,subd,span,label;
	root=new E('div',{className:'Xtree_title'});
	span=new E('span',{innerHTML:'<label><a href="?a=recommand&id='+o.id+'">'+o.t+'</a></label>'});
	subd=new E('div',{className:'Xtree_sub'});
	if(o.c.length==0){
		span.className=(l==x+1?'X8':'X9');
	}else{
	subd.style.backgroundColor='#fff';
	subd.style.backgroundPosition=(l==x+1?'-888px 0':'0 0');
		span.className=(l==x+1?'X2':'X5');
		span.onclick=function(){
			var oC=span.className;
			if(subd.style.display=='none'){
				subd.style.display='block';
				span.className=(oC=='X1'?'X2':'X5');
			}else{
				subd.style.display='none';		
				span.className=(oC=='X2'?'X1':'X4');
			}
		};
	}
	root.appendChild(span);
	if(o.c)if(o.c.length>0){
		for(var i=0;i<o.c.length;i++){
			var n=Xlist(o.c[i],i,o.c.length);
			subd.appendChild(n[0]);
			subd.appendChild(n[1]);
		}		
	}
	//span.click();
	return [root,subd];
}

function Xtree(d,id){
	var o=Xlist(d,0,1);
	Xin(id).appendChild(o[0]);
	Xin(id).appendChild(o[1]);
}