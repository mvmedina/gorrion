class Sigesp::ArticulosController < ApplicationController
	def index 
		@tipo = Sigesp::TipoArticulo.find(params[:tipoarticulo]) 
		@lista = Sigesp::Articulo.includes(:unidad).where(tipo_articulo: @tipo).search(params[:page], params[:search], params[:sort])
	    respond_to do |format|
	        format.html { render layout: false }
	    end		
	end 
end
