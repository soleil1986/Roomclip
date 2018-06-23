// File APIを使った処理

$(function() {
  $('.clip-preview').change(function(){
    var index = $('.clip-preview').index(this);
    $('.clip-preview img').eq(index).remove();
    var file = $(this).prop('files')[0];
    if(!file.type.match('image.*')){
      return;
    }
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      $('.clip-auto-preview').eq(index).html('<img class="resizeimage", src="' + fileReader.result + '"/>');
    }
    fileReader.readAsDataURL(file);
  });
});
