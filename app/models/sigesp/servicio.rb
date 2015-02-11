class Sigesp::Servicio < ActiveRecord::Base

	self.primary_key = 'seq_servicio'
	self.table_name = 'sigesp_espc.sigesp_servicios'

	

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
