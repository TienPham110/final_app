$(".edit_album").validate({
    //error place
    errorPlacement: function (error, element) {
      error.insertBefore(element);
    },
  //adding rule
    rules: {
    "album[title]":{
      required: true,
    }
    },
    // error messages
    messages: {
      title:{
        required: "Username is required."
      }
    }
  });
  