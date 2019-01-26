class DesignsController < ApplicationController
	def index
		@designs = Design.all.order("created_at DESC")
	end

	def new
		@search = []
		# returns an array of hashes
    @search = SpoonflowerApi.new.find(params[:q])['results'] unless params[:q].nil?
	end

	def create
    @design = Design.new(design_params)
    @design.save
	    if @design.save
	    	flash[:notice] = 'Design has been added to favourites!'
	    else
	    	flash[:notice] = 'Design already in Favourites!'
    end
    redirect_to designs_path
  end

  def destroy
  	@design = Design.find(params[:id])
  	@design.destroy
  	flash[:notice] = 'Design removed from favourites!'
  	redirect_to designs_path
  end

  def random_search
  	@random_search = SpoonflowerApi.new.random(rand(1..740579), 1)['results']
  end
  
  private

  def design_params
    params.require(:design).permit(:name, :thumbnail_url) 
  end
end