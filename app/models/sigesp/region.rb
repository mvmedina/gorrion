class Sigesp::Region < ActiveRecord::Base
	self.primary_key = 'seq_region'
	self.table_name = 'sigesp_espc.sigesp_regiones'
	
	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
