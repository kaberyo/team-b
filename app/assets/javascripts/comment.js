$(function(){
 function buildHTML(comment){
   var html = `<p>
  <strong>
    <%= link_to comment.user.name, "/users/#{comment.user_id}" %>
      <%= comment.text %>
    <% end %>
  </strong>
</p>
`
   return html;
 }
 $('#new_comment').on('submit', function(e){
   e.preventDefault();
   console.log(this)
   var formData = new FormData(this);
   // var href = window.location.href + '/comments'
   $.ajax({
     url: location.href,
     type: "POST",
     data: formData,
     dataType: 'json'
     // processData: false,
     // contentType: false
   })
   .done(function(data){
     var html = buildHTML(data);
     $('.comments').append(html)
     $('.textbox')[0].reset()
   })
   .fail(function(){
     alert('error');
   })
 })

});
