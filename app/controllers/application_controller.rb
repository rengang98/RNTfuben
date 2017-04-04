class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def get_data
    @categories = Category.data

  end
end
