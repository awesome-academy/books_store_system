class Admin::CategoriesController < AdminController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category_created"
      redirect_to root_url
    else
      flash[:danger] = t "create_failse"
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :parent_id, :picture
  end
end
