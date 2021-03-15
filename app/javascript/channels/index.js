// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

/* アイコンプレビュー表示 */
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  // 画像入力フォームが変更されたら発火
  $("#profile_photo").change(function(){
    readURL(this);
  });
});
/* アイコンプレビュー削除 */
$(function(){
  $('#preview-delete').click(function(){
    $('input[type="file"]').val(null);
    var src = $('.edit-profile-icon').attr('src');
    $('.edit-profile-icon-preview').attr('src',src);
    return false;
  });
});


/* profilebar */
// リスト表示切り替え
$(function() {
  $('.pb-btn').click(function() {
    $('.active').removeClass('active');
   var clickedIndex = $('.pb-btn').index($(this));
    $('.slide').eq(clickedIndex).addClass('active');
  });
});
// リストカテゴリ名の透過切り替え
$(function(){
  $('.pb-btn').click(function() {
    $('.pb-btn').toggleClass('opa05');
  });
});
