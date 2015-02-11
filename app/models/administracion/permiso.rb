class Administracion::Permiso < ActiveRecord::Base
	belongs_to :controlador, class_name: "Administracion::Controlador"

	self.per_page = 10 

	def self.search(page = 1 , search , sort)
	    search ||= ""
   	 	sort ||= "" 
	    if search.empty? 
	      paginate(page: page).order(sort) rescue paginate(page: 1) 
	    else
	      paginate(page: page).where("#{sort} like ?","%#{search}%").order("#{sort} asc")
	    end 
	end 
	
end
