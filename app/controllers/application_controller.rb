class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper Payola::PriceHelper

  def index
    @products = PayolaModel.page(params[:page]).per(16)
  end
end
