module ProductsHelper

  def parent_cate id
    category = Category.find_by id: id
    return unless category.parent_id
    parent_category = Category.find_by id: category.parent_id
  end

end
