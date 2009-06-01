function callMeOften(id)
{
  return function() {
     $.ajax({
       method: 'get',
       url: '/update_project/' + id,
       dataType : 'text',
       success: function (text) { $('h4 a#' + id).parents('h4').next('h5').next('ul').fadeOut('slow').html(text).fadeIn('slow'); }
     });
    }
}



jQuery(document).ready(function($) {
  $.fn.slowEach = function( interval, callback ) { 
    var array = this; 
    if( ! array.length ) return; 
    var i = 0; 
    next(); 
    function next() { 
      if( callback.call( array[i], i, array[i] ) !== false ) 
        if( ++i < array.length ) 
          setTimeout( next, interval ); 
    } 
  }; 

  $('.story a').live('click', function(){ $(this).next('p').slideToggle('slow'); });
  $('h4 a').slowEach(8000, function(){
    setInterval(callMeOften(this.id), 20000);
  });
});
