class TplaysController < ApplicationController

  def show
    @categories = Category.data

    @tplay = Tplay.find params[:id]
  end

end