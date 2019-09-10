function searchProduct(value){
  $.ajax({
    type: 'get',
    url: '/search',
    data: {
        q: {
        title_or_author_name_cont_any: value
        }
    },
    dataType: 'script'
  })
}
document.addEventListener('turbolinks:load', function () {
  $('#search').on('click', function(){
    $('.option').addClass('d_block');
  })
})
