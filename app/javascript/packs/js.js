// Like and unlike
$(document).ready(function(){
  $(".heart").click(function(){
    if($("i",this).hasClass("fa-heart")){
      $("i",this).removeClass("fa-heart")
      $("i",this).addClass("fa-heart-o")
      num = $(".like_number",$(this).closest("div")).text()
      console.log(num)
      like_num = parseInt(num) 
      like_num -= 1
      $(".like_number",$(this).closest("div")).text(like_num)
    }else{
      $("i",this).removeClass("fa-heart-o")
      $("i",this).addClass("fa-heart")
      num = $(".like_number",$(this).closest("div")).text()
      like_num = parseInt(num) 
      like_num += 1
      $(".like_number",$(this).closest("div")).text(like_num) 
    }
  });  
});

// Get title and description
$(document).ready(function() {
  var index
  $('.photo_item .photo_feed_avatar').click(function(){
    photo_item = $(this).closest('.photo_item')
    index = photo_item.index()
    src = $("img:first-child",this).attr("src")
      title = $(".title").map(function(){
        return $(this).text()
      })
      description = $(".description").map(function(){
        return $(this).text()
      })
      $("#photoModal").attr("src",src)
      $("#myModalLabel").text(title[index])
      $("#myModalDescription").text(description[index])
      console.log(src)
    })
    $('#pills-tab button:first-child').click(function(){
      if($("#pills-album").hasClass("show")){
        $("#pills-album").removeClass("active")
        $("#pills-photo").addClass("active")
        $("#pills-album-tab").removeClass("border-feed-photo")
        $("#pills-photo-tab").addClass("border-feed-photo")
      }
      else{
        $(this).removeClass("border-feed-photo")
      }
    }) // Select first tab
    $('#pills-tab button:last-child').click(function(){
      if($("#pills-photo").hasClass("show")){
        $("#pills-photo").removeClass("active")
        $("#pills-album").addClass("active")
        $("#pills-photo-tab").removeClass("border-feed-photo")
        $("#pills-album-tab").addClass("border-feed-photo")
      }
    }) // Select last tab
})

// follow and unfollow
$(document).ready(function(){
  $(".btn_toggle_follow").click(function(){
    if($(this).hasClass("following")){
      $(this).removeClass("following")
      $(this).addClass("follow")
      $(this).attr("value", "follow") 
      console.log(this)
    }
    else{
      $(this).removeClass("follow")
      $(this).addClass("following")
      $(this).attr("value", "unfollow") 
      console.log(this)
    }
  })
})

// up load images (preview)

  $(document).ready(function() {
    handle_preview($("#photo_image"), $("#image_label"));
    $("#photo_shared").addClass("form-control")
    $("#album_shared").addClass("form-control")
  });

  $(document).ready(function() {
    handle_preview($("#button_change_avatar"), $("#avatar_my"));
  });

  function readURL(input, image) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        image.attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  
  function handle_preview(input_tag, image){
    input_tag.change(function(e){
      var file = e.target.files[0];
      readURL(e.target, image);
      
    });
  }

