class Sigesp::Cargo < ActiveRecord::Base
	self.primary_key = 'codcar'
	self.table_name = 'public.sigesp_cargos'

	belongs_to :dt_cargo, foreign_key: "codemp", class_name: "Sigesp::DtCargo"
	belongs_to :solicitud_cargo, foreign_key: "codemp", class_name: "Sigesp::SolicitudCargo"
	has_many :dts_cargos, class_name: "Sigesp::DtsCargo", foreign_key:"codcar"


	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end

end
