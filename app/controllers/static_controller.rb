class StaticController < ApplicationController
  def index
  	@schoolhouses = schoolhouses
  end
end
