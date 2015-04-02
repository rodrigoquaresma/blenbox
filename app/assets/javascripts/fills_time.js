(function ($){

  window.onload = function() {

    $('.table-sign-in tbody tr:first-child').addClass('focused');

    // $('.table-sign-in tbody tr td.hour-sign-out').changeTime();

    // console.log(tr_time)

    // time_out.html()

    var year = '2013';
    var month = '04';
    var day = '18';

    var hour = '12';
    var min = '35';

    var reserv = new Date(year,month,day,hour,min)

    console.log(reserv);



    $('.table-sign-in tbody tr').each(function() {
      var singInTime = $(this).find(".hour-sign-in").html();
      var singOutEnv = $(this).find(".hour-sign-out");


      var xreserv = reserv.getTime() + 3000;

      xreserv.setTime();

      singOutEnv.html(xreserv);


    });


    // function changeTime() {
    //   var jqThis = $(this),
    //   jqThisTr = jqThis.closest('tr');
    //   // time_out = $('.table-sign-in tbody tr td.hour-sign-out'),
    //   // tr_time = $('.table-sign-in tbody tr td.hour-sign-in').closest('tr');
    //
    //   jqThis.html(jqThisTr.find('.hour-sign-in'));
    //
    //
    // }

    // function changeImage( el, pos ) {
    // 	$preview.attr( 'src', el.data( 'preview' ) );
    // 	$carouselItems.removeClass( 'current-img' );
    // 	el.addClass( 'current-img' );
    // 	carousel.setCurrent( pos );
    // }
  }

})(jQuery);
