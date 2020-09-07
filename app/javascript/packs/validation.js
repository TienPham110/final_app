$(document).ready(function() {
    $("#signup-form").validate({
        rules: {
            "user[firstName]": {
                required: true,
                maxlength: 25
            },
            "user[lastName]": {
                required: true,
                maxlength: 25
            },
            "user[email]": {
                required: true,
                email: true,
                maxlength: 255
            },
            "user[password]": {
                required: true,
                minlength: 8,
                maxlength: 64
            },
            "user[password_confirmation]": {
                required: true,
                minlength: 8,
                maxlength: 64,
                equalTo: "#user_password"
            }
            
        },
        messages: {
            "user[firstName]": {
                required: "Please enter your first name",
                maxlength: "First Name must has maximum 25 characters long"
            },
            "user[lastName]": {
                required: "Please enter your last name",
                maxlength: "Last Name must has maximum 25 characters long"
            },
            "user[email]": {
                required: "Please enter your email",
                maxlength: "Email must has maximum 255 characters long"
            },
            "user[password]":{
                required: "Please enter your password",
                minlength: "Password must has minimum 8 characters long",
                maxlength: "First Name must has maximum 64 characters long"
            },
            "user[password_confirmation]": {
                required: "please enter your password again",
                equalTo:"Please enter the same password"
            }
        },
        errorPlacement: function(error, element) {
            var name = element.attr("name")
            if(name == "user[firstName]"){
                $("#errorFname").html(error)
   
            }
            else if(name == "user[lastName]"){
                $("#errorLname").html(error)
            }
            else if(name == "user[email]"){
                $("#errorEmail").html(error)
            }
            else if(name=="user[password]"){
                $("#errorPass").html(error)
            }
            else if(name == "user[password_confirmation]"){
                $("#errorConfirmPass").html(error)
            }
            
        }       
    });
});