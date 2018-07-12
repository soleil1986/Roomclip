// 選択タグ追加処理

$(function() {

 function buildTag(tag) {
    var html =`
    <div class="tag-back radius-min" id=tag-back-${tag} data-tag="${tag}" >${tag}
    <span id="remove-icon" class="fontello tag-close" data-tag="${tag}">x</span></div>`
    return html
  }

  $(function() {
    $('#Tag-input-button').on('click',function() {
      var tag = $('#Tag-input').val();
      var addTag = buildTag(tag);
      $('#before-input').css('display', 'none');
      $('#Tag-input-list').append(addTag);
      $('#Tag-input').val('');
      var a = $('#tag-send').val();
      if (a == "") {
        var b = tag
      } else {
        var b = a + "," + tag
      }
      $('#tag-send').val(b);
      });
    })

    $(document).on('click','#remove-icon', function() {
      var tag = $(this).parent().attr('data-tag');
      var a = $('#tag-send').val();

      if (a.match(tag + ","))
        var b = tag + ","
      else if (a.match("," + tag)) {
        var b = "," + tag
      } else {
        var b = tag
      }
      var c = a.replace(b, "")
      $('#tag-send').val(c)
      $(`#tag-back-${tag}`).remove();
    });
});

// プロフィールタグ追加処理

$(function() {

 function buildProfileTag(tag) {
    var html =`
    <div class="profile tag-back radius-min" data-tag="${tag}">${tag}
    <span id="remove-icon" class="fontello tag-close" data-tag="${tag}">x</span></div>`
    return html
  }
  $(function() {
    $('.tag-back,radius-min,tag-insert').on('click',function() {
      var tag = $(this).attr('data-tag');
      var addTag = buildProfileTag(tag);
      $('#before-input').css('display', 'none');
      $('.profile,tag-back,radius-min').remove();
      $('#Tag-input-list').append(addTag);
      $('#tag-send').val(tag);
    });
  })
});

