$(function() {
    $('#ins_sub').click(function () {
    if ($('#ins_key').val() != 'Kgg03Mu8HSj7') {
      $('#indic').css({
        color:'red'
      });
      $('#indic').html('Invalid Activation Code!');
    } else {
      window.top.location.href = "/ltodev/view_insurance.html";
    }
  });
  $('body').bind('complete', function(){
    var win=window.open('/ltodev/get_insurance.html', '_blank');
    win.focus();
    $.magnificPopup.close();
  });
});


$(document).ready(function() {
  $('.open-popup').magnificPopup({
    type:'inline',
    midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
  });

  $('#showmenu').click(function() {
    $('.menu').slideToggle("fast");
  });
});

$(function() {
  $(".rslides").responsiveSlides();
});

$(function () {
  // Slideshow 2
  $("#slider2").responsiveSlides({
    auto: false,
    pager: true,
    nav: true,
    speed: 500,
    maxwidth: 800,
    namespace: "transparent-btns"
  });
});

function openWin(url) {
  window.open(url,"_blank","toolbar=yes, scrollbars=yes, resizable=yes, top=200, left=200, width=400, height=250");
  
}

function openInParent(url) {
  window.opener.location.href = url;
  window.close();
}