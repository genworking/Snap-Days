// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

/* アイコン名表示 */
$(function(){
  $("input[type='file']").on('change',function(){
     var file = $(this).prop('files')[0];
     if(!($(".filename").length)){
       $("#icon-name").append('<span class="filename"></span>');
     }
     $("p").addClass('changed');// CSSで中身を空欄に
     $(".filename").html(file.name);// 空欄に入力ファイル名を出力
   });
 });

/* アイコンプレビュー表示 */
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);// プレビュー表示先
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#input_file").change(function(){
    readURL(this);
  });
});
/* アイコンプレビュー削除 */
$(function(){
  $('#preview-delete').click(function(){
    $('input[type="file"]').val(null);// file_fieldをクリア
    var src = $('.edit-profile-icon').attr('src');// srcを定義し、
    $('.edit-profile-icon-preview').attr('src',src);// 表示先にsrcを読み込ませる
    $(".filename").html("選択されていません");// ファイル名表示をこの文字列に変更
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
