// $("#menu-toggle").click(function(e) {
//         e.preventDefault();
//         $("#wrapper").toggleClass("active");
// });



function init_sidebar() {
	$('#menu_toggle').click(function(){
		
		//document.getElementById("sidebar-menu").style.width = "0";
		if($('#sidebar-menu').hasClass('active')){
			$('#sidebar-menu').removeClass('active');
			$('.col-md-3.left_col').css('display','none');
			$('.top_nav').css('margin-left','0');
			$('.right_col').removeClass('col-md-9 col-lg-9');
			
		} else {
			$('#sidebar-menu').addClass('active');
			$('.right_col').addClass('col-md-9 col-lg-9');
			$('.col-md-3.left_col').css('display','flex');
			$('.top_nav').css('margin-left','230px');
			
		}
		
	});

	
};

$(document).ready(function() {
	init_sidebar();
	$('#nav-menu').find('li').click(function(){
		if($(this).hasClass('selected_menu')){
			$(this).removeClass('selected_menu');
		} else {
			alert('no lo tiene');
			$(this).addClass('selected_menu');
			//$(this).addClass('selected_menu');
		}
	});
});	