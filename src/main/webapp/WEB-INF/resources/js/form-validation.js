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
			},
			username : "required",
			mobileno : "required"

		},

		message : {
			name : "Name is required",
			email : "Please enter a valid email address",
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

$(function() {

	$("form[id='category-form']").validate({

		rules : {
			name : "required"			
		},

		message : {
			name : "Category Name is required",			
		},

		submitHandler : function(form) {
			form.submit();
		}

	})

})
