$(document).ready(function(){
			document.body.style.height = (document.documentElement.clientHeight + 60) + 'px';
			window.scrollTo(0, 1);
			
			$("#btn").on("mousedown",function(){
				$(this).attr("src", "/CMS/images/installpage/btn_install_on.png");
			}).on("mouseup",function(){
				$(this).attr("src", "/CMS/images/installpage/btn_install.png");
			});
			
			$(".ins_bottom button").on("click",function(){
				if(navigator.userAgent.match(/iPhone|ipad/i)) 
				{
					location.href= $("#ios").val();
				}
				else if(navigator.userAgent.match(/Android/i))
				{ 	
					location.href= $("#android").val();
				}
				
			});
		});