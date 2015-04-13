class Sigesp::SedeServicioController < ApplicationController
	def index 
		if params[:sede].nil?
			render json: Sigesp::Servicio.all 
		else 
			@sede = Sigesp::Sede.find(params[:sede])
   	        render json: @sede.servicios    
		end 
	  end


end



