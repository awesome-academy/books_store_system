var open = true;
function viewmore() {
  var xemthem = document.getElementById('viewmore');
  var nd = document.getElementById('content');
  if (open) {
    nd.classList.remove('collapse1');
    xemthem.innerHTML = '<span>' + I18n.t('js.collapse') + '</span>';
    open = false;
  }
  else {
    nd.classList.add('collapse1');
    xemthem.innerHTML = '<span>' + I18n.t('js.view_more') + '</span>';
    open = true;
  }
}

window.onscroll = function () { scrollFunction() };

function scrollFunction() {
  if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30) {
    document.getElementById('myBtn').style.display = 'block';
  } else {
    document.getElementById('myBtn').style.display = 'none';
  }
}

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

$(document).on('click', '.rating .fa-star', function () {
  let rate = $(this).attr('data-rate');
  let star_dom = $('.rating .fa-star');
  star_dom.removeClass('active');
  for (let i = 0; i < rate; i++) {
    star_dom.eq(i).addClass('active');
  }

  $('#review_rate').val(rate);
});
