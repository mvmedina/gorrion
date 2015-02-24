class Sigesp::Articulo < ActiveRecord::Base
	self.primary_key = 'codart'
	self.table_name = 'public.siv_articulo'

	belongs_to :unidad, foreign_key: "codunimed", class_name: "Sigesp::Unidad"
	belongs_to :tipo_articulo, foreign_key: "codtipart", class_name: "Sigesp::TipoArticulo"
	has_and_belongs_to_many :cargos, class_name: "Sigesp::Cargo", join_table: "public.siv_cargosarticulo", foreign_key:"codart" ,association_foreign_key: "codcar"
   

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
