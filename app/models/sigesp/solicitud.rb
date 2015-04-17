class Sigesp::Solicitud < ActiveRecord::Base
	self.primary_key = 'numsol'
	self.table_name = 'public.sep_solicitud'

	  has_many :cuentaGastos, class_name: "Sigesp::CuentaGasto", foreign_key:"numsol"
    has_many :solicitudUsers, class_name: "Sigesp::SolicitudUser", foreign_key:"numsol"
    has_many :solicitudTipos, class_name: "Sigesp::SolicitudTipo", foreign_key:"numsol"
    has_many :dtArticulos, class_name: "Sigesp::DtArticulo", foreign_key: "numsol"
    
    belongs_to :solicitud_cargo, foreign_key: "codemp", class_name: "Sigesp::SolicitudCargo"
    belongs_to :unidadAdministrativa, foreign_key: "coduniadm", class_name: "Sigesp::UnidadAdministrativa"
    belongs_to :tipoSolicitud, foreign_key: "codtipsol", class_name: "Sigesp::TipoSolicitud"

    belongs_to :sede , foreign_key: "cod_sede", class_name: "Sigesp::Sede"
    belongs_to :servicio, foreign_key:"cod_servicio", class_name: "Sigesp::Servicio"

    belongs_to :fuenteFinanciamiento,foreign_key:"codfuefin", class_name: "Sigesp::FuenteFinanciamiento"

	def id 
		sync_with_transaction_state
		read_attribute(self.class.primary_key)
	end


  def self.search_compra(page = 1 , search , sort)
    search ||= ""
    sort ||= "" 
    join =" INNER JOIN sigesp_espc.sep_solicitud_tipo ON sigesp_espc.sep_solicitud_tipo.numsol = public.sep_solicitud.numsol" 
    if search.empty? 
      joins(join).paginate(page: page).where("sigesp_espc.sep_solicitud_tipo.bol_compra = true ").order(sort) #rescue paginate(page: 1) 
    else
      paginate(page: page).where("#{sort} like ?","%#{search}%").order("#{sort} asc")
    end 
  end 

  def self.search_almacen(page = 1 , search , sort)
    search ||= ""
    sort ||= "" 
    join =" INNER JOIN sigesp_espc.sep_solicitud_tipo ON sigesp_espc.sep_solicitud_tipo.numsol = public.sep_solicitud.numsol" 
    if search.empty? 
      joins(join).paginate(page: page).where("sigesp_espc.sep_solicitud_tipo.bol_compra = false ").order(sort) #rescue paginate(page: 1) 
    else
      paginate(page: page).where("#{sort} like ?","%#{search}%").order("#{sort} asc")
    end 
  end 



   self.per_page = 10 

end
