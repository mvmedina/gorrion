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

quitar= (fila)->
  #crear el imagen 
  imagen = $('<span>',{
    "class":"glyphicon glyphicon-minus",
    "aria-hidden":"true"
    })
  imagen.on "click",(e)->
    fila.remove() 
  $('<td>').append imagen 

cantidad= (cantidad)->
  #crear el componente
  canti = $('<input>',{
    "class":"cantidad",
    "type":"number",
    "min":"1",
    "style":"width:50px"
    "value":cantidad
    })
  canti

precio= (precio)->
  #crear el componente
  preci = $('<input>',{
    "class":"precio",
    "type":"number",
    "step":"any"
    "min":"0",
    "style":"width:50px"
    "value":precio
    })
  preci

subtotal =(cantidad,precio)->
  subt = $('<td>',{"class": "subtotal"}).append(cantidad.val()*precio.val())
  #calculo la suma de los subtotales 
  cantidad.on "keyup",(e)-> 
    subt.empty()
    subt.append(cantidad.val()*precio.val())
    sumar_subtotal()
  precio.on "keyup", (e)->
    subt.empty()
    subt.append(cantidad.val()*precio.val())
    sumar_subtotal()
  return subt

sumar_subtotal = ()->
  suma = 0;
  $('.detallesolictud .subtotal').each (index)->
    suma.empty() 
    suma += parseInt($(this).text())
    suma

  #$('.formulario_solcitud .total').append(suma.toString() + " Bs.")

#calcular_totales =()->
  #voy de fila en fila calculando todo bien bonito :-D

$('.detallesolictud .total').each (index)->
  tot = $('<td>',{"class": "total"}).append( index + ": " + $( this ).text())
  return tot

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
    cant = cantidad(0)
    prec = precio($(this).data('precio'))
    tr.append $('<td>').append($(this).data('codigo').trim())
    tr.append $('<td>').append($(this).data('denom'))
    tr.append $('<td>').append(cant)
    tr.append $('<td>').append(prec)
    tr.append $('<td>').append($(this).data('unidad'))
    tr.append $(subtotal(cant,prec))
    tr.append quitar(tr) 
    $('.detallesolictud').append tr
    sumar_subtotal()
    alert 'Articulo Agregado'
  return
