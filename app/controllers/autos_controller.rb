class AutosController < ApplicationController
	
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def new
		@auto = Auto.new
	end
	
	def create
  		@auto = Auto.new(auto_params)
 
  		if @auto.save
    		redirect_to @auto
  		else
    		render 'new'
  		end
	end

	def update
		@auto = Auto.find(params[:id])
		if @auto.update(auto_params)
			redirect_to @auto
		else
			render 'edit'
		end
	end

	def edit
		@auto = Auto.find(params[:id])
	end

	def show
    	@auto = Auto.find(params[:id])
  	end

  	def index
  		@autos = Auto.all
    end

    def destroy
    	@auto = Auto.find(params[:id])
    	@auto.destroy
    	redirect_to autos_path
    end

	private
  		def auto_params
    		params.require(:auto).permit(:marca, :modelo)
  		end
end
