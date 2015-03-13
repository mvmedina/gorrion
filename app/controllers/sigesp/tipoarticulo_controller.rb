class Sigesp::TipoarticuloController < ApplicationController
 
 	def tiposArticulos
		render json: Sigesp::TipoArticulo.all 
	end 

	

end
