$(function(){ 
  function buildHTML(message){
   if ( message.image ) {
     var html =
      `<div class="chat-main__message-list">
         <div class="name-box">
           <div class="send-name">
             ${message.user_name}
           </div>
           <div class="send-date">
             ${message.created_at}
           </div>
         </div>
         <div class="send-message">
            ${message.content}
         </div>
         <img src=${message.image} >
       </div>`
     return html;
   } else {
     var html =
      `<div class="chat-main__message-list">
         <div class="name-box">
           <div class="send-name">
             ${message.user_name}
           </div>
           <div class="send-date">
             ${message.created_at}
           </div>
         </div>
         <div class="send-message">
           ${message.content}
         </div>
       </div>`
     return html;
   };
 }
$('#new_message').on('submit', function(e){
  e.preventDefault();
  var formData = new FormData(this);
  var url = $(this).attr('action')
  $.ajax({
    url: url,
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false
  })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('form')[0].reset();
      $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight})
      $('.form__submit').prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
})
});