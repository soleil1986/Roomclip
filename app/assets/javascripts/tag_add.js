// タグ追加処理
$(function() {

 function buildTag(tag) {
    var html =`
    <div class="tag-back radius-min" data-tag="${tag}">${tag}
    <span id="remove-icon" class="fontello tag-close" data-tag="${tag}">x</span></div>`
    return html
  }

  $(function() {
    $('#Tag-input-button').on('click',function(e) {
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
    })
  })
    $(document).on('click','#remove-icon', function() {
      $(this).parent().remove();
    });
});
