$(document).ready(function () {
 
  $("form.upvote").submit(function(event){
    event.preventDefault();
    var postId = $(this).data('post-id')
    var action = "/upvote/" + postId;
    var clickedOn = $(this)
    
    $.post(action, function(server_response){
      console.log(server_response);
      $('span[data-post-id=' + postId + ']').html(server_response);
      clickedOn.hide()
    });
  });
});
