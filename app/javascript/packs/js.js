
$(document).ready(function(){
  $(".heart").click(function(){
    if($(this).hasClass("liked")){
      $(this).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
      $(this).removeClass("liked");
      num = $(".like_number",$(this).parent()).text()
      like_num = parseInt(num) 
      like_num -= 1
      console.log($(this).attr("class"))
      $(".like_number",$(this).parent()).text(like_num)
    }else{
      $(this).html('<i class="fa fa-heart" aria-hidden="true"></i>');
      $(this).addClass("liked");
      num = $(".like_number",$(this).parent()).text()
      like_num = parseInt(num) 
      like_num += 1
      console.log(like_num)
      $(".like_number",$(this).parent()).text(like_num)
      
    }
  });
});
$(document).ready(function() {
  var index
  $('.photo_item .photo_feed_avatar').click(function(){
    photo_item = $(this).parent().parent().parent()
    index = photo_item.index()
    src = $("img:first-child",this).attr("src")
      title = $(".title").map(function(){
        return $(this).text()
      })
      description = $(".description").map(function(){
        return $(this).text()
      })
      console.log(title)
      $('#myModal').modal("show")
      $("#photoModal").attr("src",src)
      $("#myModalLabel").text(title[index])
      $("#myModalDescription").text(description[index])
      
    })

})
$(document).ready(function() {
  var index
  $('.photo_item .photo_tab_album').click(function(){
    photo_item = $(this).parent().parent().parent().parent().parent().parent()
    index = photo_item.index()
    console.log("a")
    src = $("img:first-child",this).attr("src")
      title = $(".title").map(function(){
        return $(this).text()
      })
      description = $(".description").map(function(){
        return $(this).text()
      })
      $("#myModal").modal("show")
      $("#photoModal").attr("src",src)
      $("#myModalLabel").text(title[index])
      $("#myModalDescription").text(description[index])
      console.log(src)
    })

})
$(document).ready(function(){
  $(".btn_discovery_follow label").click(function(){
    if($(this).hasClass("following")){
      $(this).removeClass("following")
      $(this).text("follow")
      console.log(this)
    }
    else{
      $(this).addClass("following")
      $(this).text("following")
      console.log(this)
    }
  })
})
$(document).ready(function(){
  $(".btn_unfollow label").click(function(){
    if($("input",this).is(":checked")){
      $(this).html('<input type="checkbox" autocomplete="off"> follow')
      $(this).addClass("unfollowed")
      console.log(this)
    }
    else{
      $(this).html('<input type="checkbox" autocomplete="off" checked> unfollow')
      $(this).removeClass("unfollowed")
    }
  })
})

function readURL(input) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#blah')
              .attr('src', e.target.result);
      };

      reader.readAsDataURL(input.files[0]);
  }
}