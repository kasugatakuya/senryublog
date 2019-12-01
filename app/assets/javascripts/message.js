$(function(){
  function buildHTML(message){
    let html = `<div class="message">
                  <div class="upper-message">
                  ${message.content}
                  </div>
                  <div class="lower-message__user-name">
                  ${message.user_name}
                  </div>
                  <div class="lower-message__date">
                  ${message.date}
                  </div>
                </div>`
    $('.messages').append(html); 
  }



  $('#new_message').on('submit', function(e){   
    e.preventDefault(); 
    console.log(this)
    let formData = new FormData(this); 
    let url = $(this).attr('action');
    $.ajax({ 
      url: url,
      type: "POST", 
      data: formData, 
      dataType: 'json', 
      processData: false,
      contentType: false 
    })
    .done(function(message){
      console.log("成功");
      buildHTML(message);   
      $('#message_content').val('')
      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      console.log("失敗");
      alert("5・7・5で入力してね")
    })
    return false;
  })
});