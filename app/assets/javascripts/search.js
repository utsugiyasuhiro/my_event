$(function() {

  var search_list = $(".contents.row");

  function appendEvent(event) {
    if(event.user_sign_in && event.user_sign_in.id == event.user_id){
      var current_user = `<li>
                            <a href="/events/${event.id}/edit" data-method="get" >編集</a>
                          </li>
                          <li>
                            <a href="/events/${event.id}" data-method="delete" >削除</a>
                          </li>`
    } else {
      var current_user = ""
    }

    var html = `<div class="content_post" style="background-image: url(${event.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top.png"></span>
                    <ul class="more_list">
                      <li>
                        <a href="/events/${event.id}" data-method="get" >詳細</a>
                      </li>
                      ${current_user}
                    </ul>
                  </div>
                  <p>${event.text}</p><br>
                  <span class="name">
                    <a href="/users/${event.user_id}">
                      <span>投稿者</span>${event.nickname}
                    </a>
                  </span>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/events/searches',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(events) {
      $(".contents.row").empty();
      if (events.length !== 0) {
        events.forEach(function(event){
          appendEvent(event);
        });
      } else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});