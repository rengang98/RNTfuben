class HomeController < ApplicationController
  def index
    @categories = Category.data
    @tplays= Tplay.appear.page(params[:page]||1).per_page(params[:per_page]||10).order("id desc")
                 .includes(:main_image)
  end
end
