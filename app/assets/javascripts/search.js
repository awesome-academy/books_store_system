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
  $('#search').on('keyup', function(){
    let search = $(this).val();
    if(search.length > 2){
      searchProduct(search);
    }
    else {
      $('#show-search-product').addClass('d_none')
    }
  })
})
