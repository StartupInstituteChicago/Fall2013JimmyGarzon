class TablesController < ApplicationController
  def index
  	@x = 1
  	@title = "Index"
  end

  def show
  end

  def welcome
  	@title = "Welcome"
  end

end
