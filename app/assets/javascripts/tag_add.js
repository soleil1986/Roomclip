// 選択タグ追加処理

$(function() {

 function buildTag(mainTag) {
    var html =`

    <div class="main-tag tag-back radius-min" id="main-tag-${mainTag}" data-mainTag="${mainTag}" >${mainTag}
    <span id="remove-mainicon" class="fontello tag-close" data-mainTag="${mainTag}">x</span></div>`
    return html
  }

  $(function() {

    $('#Tag-input-button').on('click',function() {
      var mainTag = $('#Tag-input').val();
      var addTag = buildTag(mainTag);
      $('#before-input').css('display', 'none');
      $('#Tag-input-list').append(addTag);
      $('#Tag-input').val('');
      var a = $('#tag-send').val();
      if (a == "") {
        var b = mainTag
      } else {
        var b = a + "," + mainTag
      }
      $('#tag-send').val(b);

      });
    })

    $(document).on('click','#remove-mainicon', function() {
      var mainTag = $(this).parent().attr('data-mainTag');
      var a = $('#tag-send').val();

      if (a.match(mainTag + ","))
        var b = mainTag + ","
      else if (a.match("," + mainTag)) {
        var b = "," + mainTag
      } else {
        var b = mainTag
      }
      var c = a.replace(b, "")
      $('#tag-send').val(c)
      $(`#main-tag-${mainTag}`).remove();
      console.log(this);
    });
});

// プロフィールタグ追加処理

$(function() {

 function buildProfileTag(profileTag) {
    var html =`
    <div class="profile tag-back radius-min" data-tag="${profileTag}">${profileTag}
    <span id="remove-profileicon" class="fontello tag-close" data-tag="${profileTag}">x</span></div>`
    return html
  }
  $(function() {
    $('.tag-back,radius-min,tag-insert').on('click',function() {
      var profileTag = $(this).attr('data-tag');
      var addTag = buildProfileTag(profileTag);
      $('#before-input').css('display', 'none');
      $('.profile,tag-back,radius-min').remove();
      $('#Tag-input-list').append(addTag);
      var d = $('#tag-send').val();
      if (d == "") {
        var e = profileTag
      } else {
        var e = d + "," + profileTag
      }
      $('#tag-send').val(e);
    });
  })

     $(document).on('click','#remove-profileicon', function() {
      var profileTag = $(this).parent().attr('data-tag');
      var d = $('#tag-send').val();
      if (d.match(profileTag + ","))
        var e = profileTag + ","
      else if (d.match("," + profileTag)) {
        var e = "," + profileTag
      } else {
        var e = profileTag
      }
      var f = d.replace(e, "")
      $('#tag-send').val(f)
      $('.profile,tag-back,radius-min').remove();
    });
});

