module CategoriesHelper
  def parent_category
    Category.parent_category.pluck :name, :id
  end
end
