var open = true;
function viewmore() {
  var viewmore = $('#viewmore');
  var nd = $('#content');
  if (open) {
    nd.removeClass('collapse1');
    viewmore.html('<span>' + I18n.t('js.collapse') + '</span>');
    open = false;
  }
  else {
    nd.addClass('collapse1');
    viewmore.html('<span>' + I18n.t('js.view_more') + '</span>');
    open = true;
  }
}

window.onscroll = function () { scrollFunction() };

function scrollFunction() {
  if ($(document).scrollTop() > 30) {
    $('#myBtn').css('display', 'block');
  } else {
    $('#myBtn').css('display', 'none');
  }
}

function topFunction() {
  $(document).scrollTop(0);
}

$(document).on('click', '.fa-star', function () {
  let rate = $(this).attr('data-rate');
  let star_dom = $(this).parent().find('.fa-star');
  star_dom.removeClass('active');
  for (let i = 0; i < rate; i++) {
    star_dom.eq(i).addClass('active');
  }

  $(this).parent().find('#review_rate').val(rate);
});


document.addEventListener('turbolinks:load', function () {
  $('#single_item').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: false
  });

  let url = 'http://localhost:3000/en';
  let url1 = 'http://localhost:3000/vi';
  let url2 = 'http://localhost:3000/';
  let href = window.location.href;
  let list = $('.list');
  if (href == url || href == url1 || href == url2) {
    list.addClass('d_block');
  }
  $('.alert').fadeOut(3000);
  // $('.alert-success').fadeOut(3000);
  // $('.alert-danger').fadeOut(3000);
})

function nextslide() {
  var ile = $('#slideshows');
  var tmp = parseInt(ile.css('left'));
  var re = tmp - 233 + 'px';
  ile.css('left', re);
  if (tmp < - 233 * 5) {
    ile.css('left', '5px');
  }
}

// setInterval(nextslide, 6000);

function prevslide() {
  var ile = $('#slideshows');
  var tmp = parseInt(ile.css('left'));
  var re = tmp + 233 + 'px';
  ile.css('left', re);
  if (tmp > -233) {
    ile.css('left', '5px');
  }
}

var collap = true;
$(document).on('click', '.collap', function () {
  let ilement = $(this).siblings('.text');
  if (collap == true){
  ilement.removeClass('d_none');
    collap = false;
  }
  else{
    ilement.addClass('d_none');
    collap = true;
  }
})
