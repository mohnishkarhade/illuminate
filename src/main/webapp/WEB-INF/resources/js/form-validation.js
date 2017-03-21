$(function(){
	
	$("form[id='registrationForm']").validate({
		
		rules: {
			name: "required",
			email: { 
				required: true,
				email: true
			}
			
		},
		submitHandler: function(form) {
			form.submit();
		}
		
	})
	
})