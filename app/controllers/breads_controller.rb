class BreadsController < ApplicationController
  def index
  	@breads = Bread.all
    @bread = Bread.new
  end

  def create
  	@bread = Bread.new(bread_params)
  	@bread.save 
  	respond_to do |f|
  		f.js 
  	end
  end
  
  def destroy
    @bread = Bread.find(params[:id])
    @bread.destroy
    respond_to do |f|
      f.js 
    end
  end

  private
  def bread_params
  	params.require(:bread).permit(:name)
  end

end
