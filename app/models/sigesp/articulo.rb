class Sigesp::Articulo < ActiveRecord::Base
	self.primary_key = 'codart'
	self.table_name = 'public.siv_articulo'

	belongs_to :unidad, foreign_key: "codunimed", class_name: "Sigesp::Unidad"
	belongs_to :tipo_articulo, foreign_key: "codtipart", class_name: "Sigesp::TipoArticulo"
	has_and_belongs_to_many :cargos, class_name: "Sigesp::Cargo", join_table: "public.siv_cargosarticulo", foreign_key:"codart" ,association_foreign_key: "codcar"
   
	self.per_page = 10 

	def self.search(page = 1 , search , sort)
	    search ||= ""
   	 	sort = "codart" if sort =="codigo"
	    if search.empty? 
	      paginate(page: page).order(sort) rescue paginate(page: 1) 
	    else
	      paginate(page: page).where("#{sort} like ?","%#{search}%").order("#{sort} asc")
	    end 
	end 

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
