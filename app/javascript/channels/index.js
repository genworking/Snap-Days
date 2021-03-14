// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

/* profilebar */
$(function() {
  $('.pb-btn').click(function() {
    $('.active').removeClass('active');
   var clickedIndex = $('.pb-btn').index($(this));
    $('.slide').eq(clickedIndex).addClass('active');
  });
});

$(function(){
  $('.pb-btn').click(function() {
    $('.pb-btn').toggleClass('opa05');
  });
});
