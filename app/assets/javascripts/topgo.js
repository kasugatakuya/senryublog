$(function() {
  let gotop = $(".gotop");
  // gotop.hide();
  gotop.css('bottom', '-60px');
  
  $(window).scroll(function() {
    // if($(this).scrollTop() > 100) {
    //   gotop.fadeIn();
    // } else {
    //   gotop.fadeOut();
    // }
    if($(this).scrollTop() > 100) {
      gotop.stop().animate({'bottom' : '120px'}, 50);   
    } else {
      gotop.stop().animate({'bottom' : '-60px'}, 50); 
    }
  });
  gotop.click(function() {
    $('html,body').animate({scrollTop:0}, 300);
  });
});