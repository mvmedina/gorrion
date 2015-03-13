class Sigesp::Solicitud < ActiveRecord::Base
	self.primary_key = 'numsol'
	self.table_name = 'public.sep_solicitud'

	has_many :cuentaGastos, class_name: "Sigesp::CuentaGasto", foreign_key:"numsol"
    has_many :solicitudUsers, class_name: "Sigesp::SolicitudUser", foreign_key:"numsol"
    has_many :solicitudTipos, class_name: "Sigesp::SolicitudTipo", foreign_key:"numsol"
    has_many :dtArticulos, class_name: "Sigesp::DtArticulos", foreign_key: "numsol"
    belong_to :solicitud_cargo, foreign_key: "codemp", class_name: "Sigesp::SolicitudCargo"
	

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
