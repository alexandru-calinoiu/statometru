class PagesController < ApplicationController
  def index
  end

  def sign_in
    @debug = request
  end
end
