$(document).ready(function() {
    $("#signup-form").validate({
        rules: {
            firstName: {
                required: true,
                maxlength: 25
            },
            lastName: {
                required: true,
                maxlength: 25
            },
            password: {
                required: true,
                minlength: 8,
                maxlength: 64
            },
            passwordConfirm:{
                required: true,
                minlength: 8,
                maxlength: 64,
                equalTo: "#password"
            },
            email:{
                
            }
        },
        messages: {
            firstName: {
                required: "Please enter your first name"
            },
            lastName: {
                required: "Please enter your last name"
            },
            password:{
                required: "Please enter your password"
            },
            passwordConfirm: {
                required: "please enter your password again",
                equalTo:"Please enter the same password"
            }
        },
        errorPlacement: function(error, element) {
            var name = element.attr("name")
            if(name == "firstName"){
                $("#errorFname").html(error)
            }
            else if(name == "lastName"){
                $("#errorLname").html(error)
            }
            else if(name=="password"){
                $("#errorPass").html(error)
            }
            else if(name == "passwordConfirm"){
                $("#errorConfirmPass").html(error)
            }
        }       
    });
});