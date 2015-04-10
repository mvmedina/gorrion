module Sigesp::SolicitudsHelper
  
  def estadoSolicitud(estado)
    
    if estado == 'E'
     "Emitida"
    elsif estado == 'R'
     "Registrada"
    elsif estado == 'C'
     "Contabilizada"
    elsif estado == 'A'
     "Anulada"
    elsif estado == 'P'
     "Procesada"
    elsif estado == 'D'
     "Despachada"
    elsif estado == 'I'
     "Espera Aprobacion Admin"
    elsif estado == 'O'
     "Analisis Oferta"
    elsif estado == 'V'
     "Espera Aprobacion Pres"
    elsif estado == 'L'
     "Parcial"
        
    end
  end

 def tipoSolicitud(tipo)
   
   if tipo == 'BIENES PRECOMROMISO'
   	"Producto"
   elsif tipo == 'SERVICIOS PRECOMPROMISOS'
   	"Servicio"
   end
 end

end
