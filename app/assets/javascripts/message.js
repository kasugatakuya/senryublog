$(function(){
  function buildMessage(message){
    let html = `<div class="upper-message">
                  <div class="lower-message">
                    ${message.content}
                  </div>
                  <div class="upper-message__user-name">
                    ${message.user_name}
                  </div>
                  <div class="upper-message__date">
                    ${message.date}
                  </div>
                </div>`
    return html;
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
      let html = buildMessage(message);
      $('.message').append(html)
      $('#message_content').val('')
    })
    .fail(function(){
      console.log("失敗");
      alert("5・7・5で入力してね")
    })
    return false;
  })
});