# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


(($) ->
  $.fn.campo_error = (mensaje) ->
    @parent().parent().removeClass 'has-error'
    if mensaje != undefined
      @parent().parent().addClass 'has-error'
      padre = @parent()
      label = $('<label>').text(mensaje)
      label.click ->
        @remove()
        padre.parent().removeClass 'has-error'
        return
      padre.append label
      label.addClass 'erro_campo'
    return
  return 
) jQuery


$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  html = """
         <div class="modal" id="confirmationDialog">
          <div class="modal-dialog">
          <div class="modal-content">
           <div class="modal-header">
             <a class="close" data-dismiss="modal">×</a>
           </div>
           <div class="modal-body">
             <h3>#{message}</h3>
           </div>
           <div class="modal-footer">
             <a data-dismiss="modal" class="btn">Cancel</a>
             <a data-dismiss="modal" class="btn btn-primary confirm">OK</a>
           </div>
          </div>
          </div>
         </div>
         """
  $(html).modal()
  $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)

#crear Ventana
(($) ->
  close_action = (e)->
    modal = $(this).parent().parent().parent().parent()
    modal.modal('hide')
    modal.remove()
    return 

  $.fn.footer =(title_button,acion)->
    modal_footer = $('<div/>',{ 
      class: "modal-footer" 
    })
    button_close = $('<button/>',{ 
      type: "button"
      class: "btn btn-default" 
    })
    button_close.append "cerrar"
    button_close.on "click", close_action  

    button_action = $('<button/>',{ 
      type: "button"
      class: "btn btn-primary" 
    })
    
    if title_button != null
      modal_footer.append button_action
      button_action.on "click", acion  
      button_action.append title_button
  
    modal_footer.append button_close
    return  modal_footer

  $.fn.crearHear =(titulo)->
    modal_header = $('<div/>',
    { 
      class: "modal-header" 
    })
    button = $('<button/>',
    {
      type: "button"
      class: "close"
      "data-dismiss": "modal"
      "aria-label": "Close"
    })   
    span = $('<span/>',{
      "aria-hidden": "true"
    })
    
    h4 = $('<h4/>',{
      class: "modal-title"
    })
    h4.append titulo
    
    span.append "&times;"
    button.append span

    modal_header.append button 
    modal_header.append h4 
    return  modal_header

  $.fn.crearVentana =(header,body,footer) ->
    modal = $('<div/>',
    {
      class: "modal"
      style:"width:95%" 
    })
    modal_dialog = $('<div/>',
    {
      class: "modal-dialog modal-lg"
      style:"width:95%" 
    })    
    modal.append modal_dialog

    modal_content = $('<div/>',
    {
      class: "modal-content"
     
    })    
    modal_dialog.append modal_content

    modal_content.append header
    modal_content.append body
    modal_content.append footer
    $("body").append modal   
    return modal 
) jQuery


$(document).on 'click','#prueba2', (e) ->
  alert 'holaaa'
  #llamar al html y organizar lo demas 

  formulario = {}
  formulario.sigesp_solicitud = {}
  formulario.sigesp_solicitud.ced_bene = "holaaaa"

  articulo1 = {}
  articulo1.id = "12"
  articulo1.cantidad="12"
  articulo1.precio="12"

  articulo2 = {}
  articulo2.id = "12"
  articulo2.cantidad="12"
  articulo2.precio="12"


  articulo3 = {}
  articulo3.id = "12"
  articulo3.cantidad="12"
  articulo3.precio="12"

  lista = []
  lista.push articulo1
  lista.push articulo2
  lista.push articulo3

  formulario.detalle = {}
  formulario.detalle.articulos = JSON.stringify(lista)

  data=
  url: "http://0.0.0.0:3000/sigesp/solicituds.json"
  type: 'post'
  data: formulario
  success: (data) ->
    alert 'gogogogogogo'
  $(".erro_campo").remove()
  $.ajax data
  e.preventDefault()
  return
