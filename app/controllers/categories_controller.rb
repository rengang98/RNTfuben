class CategoriesController < ApplicationController

  def show
    @categories = Category.data
    @category = Category.find params[:id]
    @tplays = @category.tplays.appear.page(params[:page] || 1).per_page(params[:per_page] || 10)
                    .order("id desc").includes(:main_image)
  end

end