class Sigesp::SolicitudCargo < ActiveRecord::Base
	self.primary_key = 'codemp'
	self.table_name = 'public.sep_solicitudcargos'

	has_many :cargos, class_name: "Sigesp::Cargo", foreign_key:"codemp"
    has_many :solicituds, class_name: "Sigesp::Solicitud", foreign_key:"codemp"

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
