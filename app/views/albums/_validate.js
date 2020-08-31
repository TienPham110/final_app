
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
      "album[title]":{
        required: "Title must be entered "
      }
    }
  });