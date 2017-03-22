$(function() {

	$("form[id='registrationForm']").validate({

		rules : {
			name : "required",
			email : {
				required : true,
				email : true
			},
			password : {
				required : true,
				minlength : 5
			}

		},

		message : {
			name : "Name is required",
			email : "Please enter a valid emal address",
			password:{
				required:"Password is required",
				minlength:"Password must be atleast 5 character long"
			}
		},

		submitHandler : function(form) {
			form.submit();
		}

	})

})