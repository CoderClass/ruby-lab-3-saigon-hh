class VisitorsController < ApplicationController
  def index
    if params[:sort] && params[:sort].to_s == 'alphabetical'
    	@products = Product.alphabetical
    else
    	@products = Product.all	
    end

  end
end
