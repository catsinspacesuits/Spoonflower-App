class DesignsController < ApplicationController
	def index
		@designs = Design.all.order("created_at DESC")
	end

	def new
		# returns an array of hashes
		@search = SpoonflowerApi.new.find(params[:q])['results']
	end

	def create
    @design = Design.new(design_params)
    @design.save
	    if @design.save
	    	flash[:notice] = 'Design has been added to favourites!'
	    else
	    	flash[:notice] = 'Design already in Favourites!'
    end
    redirect_to new_design_path
  end

  def destroy
  	@design = Design.find(params[:id])
  	@design.destroy
  	flash[:notice] = 'Design removed from favourites!'
  	redirect_to designs_path
  end

  # searches for a random design
  def random_search
  	@random = SpoonflowerApi.new.random(rand(1..740579), 1)['results']
  end

  private

  def design_params
    params.require(:design).permit(:name, :thumbnail_url) 
  end
end