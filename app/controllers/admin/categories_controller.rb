class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end


# def product_params
#   params.require(:product).permit(
#     :name,
#     :description,
#     :category_id,
#     :quantity,
#     :image,
#     :price
#   )
# end

# def create
#   @product = Product.new(product_params)

#   if @product.save
#     redirect_to [:admin, :products], notice: 'Product created!'
#   else
#     render :new
#   end
# end