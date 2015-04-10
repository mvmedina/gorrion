class Sigesp::SolicitudUser < ActiveRecord::Base
	self.primary_key = 'codemp'
	self.table_name = 'sigesp_espc.sep_solicitud_user'

	belong_to :solicitud, foreign_key: "numsol", class_name: "Sigesp::Solicitud"

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end