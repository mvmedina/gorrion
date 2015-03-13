class Sigesp::CtrlRequisicion < ActiveRecord::Base
	self.primary_key = 'codemp'
	self.table_name = 'sigesp_espc.sigesp_ctrl_requisicion'

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
