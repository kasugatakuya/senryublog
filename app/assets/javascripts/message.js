$(function(){
  function buildHTML(message){
    let html = `<div class="message", data-message-id="${message.id}">
                  <div class="upper-message">
                  ${message.content}
                  </div>
                  <div class="lower-message__user-name">
                  ${message.user_name}
                  </div>
                  <div class="lower-message__date">
                  ${message.created_at}
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
      alert("文字を入力してね")
    })
    return false;
  })
  let reloadMessages = function () {
    if (window.location.href.match(/\/posts\/\d+\/messages/)){
      let last_message_id = $('.message:last').data("message-id");
      $.ajax({
        url: "api/messages",
        type: 'get',
        dataType: 'json',
        data: {last_id: last_message_id} 
      })
      .done(function(messages) {
        let insertHTML = '';
        messages.forEach(function (message) {
          insertHTML = buildHTML(message); 
          $('.messages').append(insertHTML);
        })
        $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'fast');
      })
      .fail(function() {
        console.log('error');
      });
    };
  };
setInterval(reloadMessages, 10000);
});