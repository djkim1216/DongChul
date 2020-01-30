/**
 * http://usejsdoc.org/
 */

$(function(){
	
	
	$.ajax({
		
		url : 'headerbar.jsp',
		dataType : 'html',
		async : false,
		success : function(data){
			$('body').prepend(data);
		}
		
	});
	
});
