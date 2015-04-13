class Sigesp::UnidadAdministrativa < ActiveRecord::Base
	self.primary_key = 'coduniadm'
	self.table_name = 'public.spg_unidadadministrativa'
	
	has_many :Solicituds, class_name: "Sigesp::Solicitud", foreign_key: "coduniadm"

    def self.buscar_unidad_ejecutora(fuente)
       joins = ' inner join public.spg_dt_unidadadministrativa d on spg_unidadadministrativa.coduniadm = d.coduniadm 
			  	 inner join 	public.spg_ep3 ep3  on (ep3.codestpro1 = d.codestpro1 and ep3.codestpro2 = d.codestpro2 and ep3.codestpro3 = d.codestpro3 ) '
		where = "ep3.codfuefin =  '#{fuente}'"
       Sigesp::UnidadAdministrativa.joins(joins).where(where).order(:denuniadm)
    end

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end
end
