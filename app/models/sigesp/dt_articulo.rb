class Sigesp::DtArticulo < ActiveRecord::Base
	self.primary_key = 'codemp'
	self.table_name = 'public.sep_dt_articulos'

	belongs_to :solicitud, foreign_key: "numsol", class_name: "Sigesp::Solicitud"

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end

end
