class Sigesp::DtCargo < ActiveRecord::Base
	self.primary_key = 'codemp'
	self.table_name = 'public.sep_dta_cargos'

	belongs_to :cargo, class_name: "Sigesp::Cargo", foreign_key:"codcar"
    belongs_to :articulo, class_name: "Sigesp::Articulo", foreign_key:"codart"


	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
