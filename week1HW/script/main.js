document.addEventListener("DOMContentLoaded",function() {
	
	var div1 = document.getElementById("div1");
	div1.style.backgroundColor = "red";

	var div2 = document.getElementById("div2");
	div2.style.backgroundColor = "aqua";
	var p = document.getElementsByClassName("parent");
	p[0].style.backgroundColor = "white";

	


	var degree = 0;

	var rotateDiv = function(){
		degree = degree + 0.1;


	p[0].style.transform = "rotate(" + degree + "deg)";
};
	rotateDiv(30);
	rotateDiv(50);

	window.setInterval(rotateDiv,10);


});