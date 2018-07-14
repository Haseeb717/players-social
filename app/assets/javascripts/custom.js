$(document).ready(function(){
    $(document).on('click','.post_comment',function(e) {
      id = $(this).attr('id');
      $("#comments_"+id).show();
    });
  })