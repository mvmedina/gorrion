class Sigesp::Articulo < ActiveRecord::Base
	self.primary_key = 'codart'
	self.table_name = 'public.siv_articulo'

	belongs_to :unidad, foreign_key: "codunimed", class_name: "Sigesp::Unidad"
	belongs_to :tipo_articulo, foreign_key: "codtipart", class_name: "Sigesp::TipoArticulo"

	# has_and_belongs_to_many :cargos, class_name: "Sigesp::Cargo", join_table: "public.siv_cargosarticulo", foreign_key:"codart" ,association_foreign_key: "codcar"    
    belongs_to :dt_cargo, foreign_key: "codemp", class_name: "Sigesp::DtCargo"

    has_many :cargos_articulos, class_name: "Sigesp::DtCargo", foreign_key:"codart"
	has_many :cargos, class_name: "Sigesp::Cargo", through: :cargos_articulos 


	
	self.per_page = 10 

	def cargo_activo
		if cargos.size == 0 
			return 0
		end 

		if  cargos[0].nil? 
			cargo = 0
		else
			cargo = cargos[0].porcar 
		end 
	end 

	def self.search(page = 1 , search , sort)
	    search ||= ""
   	 	sort = "codart" if sort =="codigo"
   	 	sort = "denart" if sort == "descripcion"
    
	    if search.empty? 
	      paginate(page: page).includes(:cargos).references(:cargos).order(sort) rescue paginate(page: 1).includes(:cargos).references(:cargos)
	    else
	      paginate(page: page).where("#{sort} like ?","%#{search}%").includes(:cargos).references(:cargos).order("#{sort} asc")
	    end 
	end 

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
