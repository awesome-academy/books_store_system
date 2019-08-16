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
