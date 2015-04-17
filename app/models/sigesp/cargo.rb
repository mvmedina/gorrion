class Sigesp::Cargo < ActiveRecord::Base
	self.primary_key = 'codcar'
	self.table_name = 'public.sigesp_cargos'

	belongs_to :dt_cargo, foreign_key: "codemp", class_name: "Sigesp::DtCargo"

	belongs_to :solicitud_cargo, foreign_key: "codemp", class_name: "Sigesp::SolicitudCargo"

	has_many :articulos_cargos, class_name: "Sigesp::DtCargo", foreign_key:"codcar"
	has_many :articulos, class_name: "Sigesp::Articulo", through: :articulos_cargos 


	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end

end
