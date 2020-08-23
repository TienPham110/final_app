
$(document).ready(function(){
    $("#heart").click(function(){
      if($("#heart").hasClass("liked")){
        $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
        $("#heart").removeClass("liked");
        like_num = parseInt($("#like_number").text()) 
        like_num -= 1
        $("#like_number").text(like_num)
      }else{
        $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
        $("#heart").addClass("liked");
        like_num = parseInt($("#like_number").text()) 
        like_num += 1
        $("#like_number").text(like_num)
      }
    });
});
$(document).ready(function() {
  var index
  var children = $('.photo_item').click(function a(){
    index = children.index(this)
    src = $("img:first-child",$(this)).attr("src")
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


})

})



