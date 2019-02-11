class MainController < ApplicationController
  def index
    @languages = Language.all
  end
end
