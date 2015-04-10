# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#sigesp_solicitud_cod_sede', (e) ->
    #pido la informacion y cargo  municipios
    e.preventDefault()
    sede = {}
    sede.sede = $(this).val()
    url = $(this).data('url')
    data =
        url: url
        type: 'get'
        data: sede
        dataType: 'JSON'
        success: (data) ->
            servicio = $('#sigesp_solicitud_cod_servicio')
            servicio.empty()
            servicio.append "<option> Seleccione </option>"
            for element in data
                option = $('<option/>',{
                        value:element.seq_servicio
                })
                option.append element.str_descripcion 
                servicio.append option 
            return 
    $.ajax data
    return



$(document).on 'change', '#sigesp_solicitud_codfuefin', (e) ->
    #pido la informacion y cargo  municipios
    e.preventDefault()
    fuente = {}
    fuente.fuente = $(this).val()
    url = $(this).data('url')
    data =
        url: url
        type: 'get'
        data: fuente
        dataType: 'JSON'
        success: (data) ->
            ejecutora = $('#sigesp_solicitud_unidadAdministrativa')
            ejecutora.empty()
            ejecutora.append "<option> Seleccione </option>"
            for element in data
                option = $('<option/>',{
                        value:element.coduniadm
                })
                option.append element.denuniadm
                ejecutora.append option 
            return 
    $.ajax data
    return


