// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

/* プロフィールアイコンプレビュー表示 */
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
/* プロフィールアイコンプレビュー削除 */
$(function(){
  $('#preview-delete').click(function(){
    $('input[type="file"]').val(null);// file_fieldをクリア
    var src = $('.edit-profile-icon').attr('src');// 変更前と同じsrcを取得し、
    $('.edit-profile-icon-preview').attr('src',src);// プレビューにそのsrcを読み込ませる
    $(".filename").html("選択されていません");// ファイル名表示をこの文字列に変更
    return false;
  });
});
/* プロフィールアイコンファイル名表示 */
$(function(){
  $("input[type='file']").on('change',function(){
     var file = $(this).prop('files')[0];
     if(!($(".filename").length)){
       $("#icon-name").append('<span class="filename"></span>');
     }
     $("#icon-name").addClass('changed');// CSSで中身を空欄に
     $(".filename").html(file.name);// 空欄に入力ファイル名を出力
   });
 });

/* 投稿画像プレビュー表示 */
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#photo_prev').attr('src', e.target.result);// プレビュー表示先
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#input_file").change(function(){
   readURL(this);
  });
});
/* 投稿画像プレビューとファイル名削除 */
$(function(){
  $('#preview-delete').click(function(){
    $('input[type="file"]').val(null);// file_fieldをクリア
    $('.upload-image-preview img').attr('src',"/upload-image-none-icon.png");// プレビューにsrcを読み込ませる
    $(".filename").html("選択されていません");// ファイル名表示をこの文字列に変更
    return false;
  });
});
/* 投稿画像ファイル名表示 */
$(function(){
  $("input[type='file']").on('change',function(){
    var file = $(this).prop('files')[0];
    if(!($(".filename").length)){
      $("#photo-name").append('<span class="filename"></span>');
    }
    $("#photo-name").addClass('changed');// CSSで中身を空欄に
    $(".filename").html(file.name);// 空欄に入力ファイル名を出力
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
