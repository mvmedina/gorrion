class Sigesp::DtsCargo < ActiveRecord::Base
	self.primary_key = 'codemp'
	self.table_name = 'public.sep_dts_cargos'

	belongs_to :cargo, foreign_key: "codcar", class_name: "Sigesp::Cargo"

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
