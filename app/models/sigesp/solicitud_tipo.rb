class Sigesp::SolicitudTipo < ActiveRecord::Base
	self.primary_key = 'numsol'
	self.table_name = 'sigesp_espc.sep_solicitud_tipo'

	belongs_to :solicitud, foreign_key: "numsol", class_name: "Sigesp::Solicitud" 

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
