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

quitar = () ->
    $('<td>').append $('<span class="glyphicon glyphicon-search" aria-hidden="true"></span>') 

$(document).on 'click', '.productos .producto', (e) ->
    #pido la informacion y cargo  municipios
    e.preventDefault()
    #cargo el articulo al detalle y le pongo para que agregen la cantidad y el precio 
    #veo si existe dentro de la lista 
    if $('#'+$(this).data('codigo').trim()).length == 0
        #No hay nadie   
        tr = $('<tr>',{
            id:$(this).data('codigo').trim()
        })        
        tr.append $('<td>').append($(this).data('codigo').trim())
        tr.append $('<td>').append($(this).data('denom'))
        tr.append $('<td>0.0</td>')
        tr.append $('<td>').append($(this).data('precio'))
        tr.append $('<td>').append($(this).data('unidad'))
        tr.append $('<td>0.0</td>')
        tr.append quitar()
        $('.detallesolictud').append tr
        $('.alert_productos').empty()
        $.aplicacion.alerta($('.alert_productos')," Articulo "+$(this).data('codigo').trim()+" agregado ","success")
    else
        $('.alert_productos').empty()
        $.aplicacion.alerta($('.alert_productos')," Ya ah sido agregado")
    return
