jQuery(document).ready(function($) {
  $('.story a').live('click', function(){ $(this).next('p').slideToggle('slow'); });
});