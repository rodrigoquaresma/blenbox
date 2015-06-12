(function ($){
  window.onload = function() {
    $('#table_front .table-sign-in tbody tr:first-child').addClass('focused');
    $(document).keyup(function(e) {
      // if (e.keyCode == 13) $('.card-back').click(); //enter
      if (e.keyCode == 32) goHandlers.goNextTr(); //espaco
      if (e.keyCode == 40) goHandlers.goNextTr(); //arrow down
      if (e.keyCode == 38) goHandlers.goBackTr(); //arrow up
      if (e.keyCode == 39) goHandlers.goCardBack(); //arrow right
      if (e.keyCode == 37) goHandlers.goCardFront(); //arrow left
    });
    var goHandlers = {
      goCardBack : function() {
        $('.table-sign-in tbody tr').removeClass('focused');
        $('#table_back .table-sign-in tbody tr:first-child').addClass('focused');
        $('.card-back').click();
  		},
      goCardFront : function() {
        $('.table-sign-in tbody tr').removeClass('focused');
        $('#table_front .table-sign-in tbody tr:first-child').addClass('focused');
        $('.card-front').click();
  		},
      goNextTr : function() {
        var selTable = $('tr.focused').closest('tbody');
        var trFocused = selTable.find('tr.focused');
        var trFocusedLast = selTable.find('tr').last();
        var trNextFocused = trFocused.next('tr');
        if (trFocusedLast.hasClass('focused')) {
          goHandlers.goCardBack();
        } else {
          trFocused.removeClass('focused');
          trNextFocused.addClass('focused');
        }
      },
      goBackTr : function() {
        var selTable = $('tr.focused').closest('tbody');
        var trFocused = selTable.find('tr.focused');
        var trFocusedFirst = selTable.find('tr').first();
        var trPrevFocused = trFocused.prev('tr');

        if (trFocusedFirst.hasClass('focused')) {
          goHandlers.goCardFront();
        } else {
          trFocused.removeClass('focused');
          trPrevFocused.addClass('focused');
        }
      }
    };
    $(".js-next-row").on('click', function() {
      goHandlers.goNextTr();
      var topPos = $('body').scrollTop();
      $("body").animate({
        scrollTop: topPos + 37
      }, 800);
    });
    $(".js-back-row").on('click', function() {
      goHandlers.goBackTr();
      var topPos = $('body').scrollTop();
      $("body").animate({
        scrollTop: topPos - 37
      }, 800);
    });
  }
})(jQuery);
