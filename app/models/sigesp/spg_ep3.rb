class Sigesp::SpgEp3 < ActiveRecord::Base
	self.primary_key = 'codemp'
	self.table_name = 'public.spg_ep3'

	has_many :fuenteFinanciamientos, class_name: "Sigesp::FuenteFinanciamiento", foreign_key:"codfuefin"
   
	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
