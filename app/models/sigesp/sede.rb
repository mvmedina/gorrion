class Sigesp::Sede < ActiveRecord::Base
	self.primary_key = 'seq_sede'
	self.table_name = 'sigesp_espc.sigesp_sedes'

	belongs_to :region, foreign_key: "int_region",class_name: "Sigesp::Region" 
	has_and_belongs_to_many :servicios, class_name: "Sigesp::Servicio",join_table: "sigesp_espc.sigesp_serviciosedes",foreign_key:"int_servicio" ,association_foreign_key: "int_sede"

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end

end
