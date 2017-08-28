
window.onload=function(){
var adiv=document.getElementById("book-t");
var ali=adiv.getElementsByTagName("li");
var odiv=document.getElementById("book-c");
var od=odiv.getElementsByTagName("div");
var index;
for(var i=0;i<ali.length;i++){
		ali[i].index=i;
  }
  adiv.addEventListener("click",function(e){
  	if(e.target.nodeName.toLowerCase()=="li"){
  		for(var j=0;j<od.length;j++){
  			od[j].style.display="none";
  			ali[j].className="";
  		}
  		ali[e.target.index].className="bookhover";
  		od[e.target.index].style.display="block";
  	}
  },false);
  };
  /*µ¯³öµÇÂ¼¿ò¼Ü*/
  $(document).ready(function() {
	  
	});