// my jscript in here
$(function() {
	
	//active schedule tags
	var hash = window.location.hash;
	hash && $('ul.nav a[href="' + hash + '"]').tab('show');
	
	$("#home a:contains('Home')").parent().addClass('active');
	$("#contact a:contains('Contact')").parent().addClass('active');
	$("#about a:contains('About')").parent().addClass('active');
	
	//add bootstrap classes to photos
	$('.photogrid img').addClass('img-circle');
	
	// make menus drop down automatically
	$('ul.nav li.dropdown').hover(function() {
		$('.dropdown-menu', this).fadeIn();
	}, function() {
		$('.dropdown-menu', this).fadeOut();
	}); //hover
	
	//show tooltips
	$("[data-toggle='tooltip']").tooltip({ animation: true});
	
	//show modals
	$('.modalphotos img').on('click', function() {
		$('#modal').modal({
			show: !0
		});
		
		var mysrc = this.src.substr(0, this.src.length-7) + '.jpg';
		$('#modalimage').attr('src', mysrc);
		$('#modalimage').on('click', function() {
			$('#modal').modal('hide')}
		)}// hide modal
		)

	
}); // jQuery is loaded
