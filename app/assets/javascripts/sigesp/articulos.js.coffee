# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

buscar = (boton)->
  url = $('.catalagoArticulo').data('url')
  datos = {}
  datos.tipoarticulo = $(boton).data('tipoarticulo')
  datos.search = $('.buscar #search').val()
  datos.sort  = $('.buscar #sort').val()
  data = 
  url: url
  data:datos 
  type: 'get'
  dataType: 'HTML'
  success: (data) ->
    # dibujo el contenedor y el buscador jejejeje
    $('.contArticulo').empty()
    $('.contArticulo').append data 
    return 
  $.ajax data
  return  
 

$(document).on 'click','.catalagoArticulo a', (e) ->
  e.preventDefault()
  url = $(this).attr('href')
  #llamar al html y organizar lo demas 
  data = 
  url: url
  type: 'get'
  dataType: 'HTML'
  success: (data) ->
    # dibujo el contenedor y el buscador jejejeje
    $('.contArticulo').empty()
    $('.contArticulo').append data 
    return 
  $.ajax data
  return  


$(document).on 'click','.buscararticulo', (e) ->
  e.preventDefault()
  buscar(this)
  return  

################################################################
tipoArticulos =(componente)->
  #listado de  tipo 
  url = $(componente).data("url")
  urlarticulo = $(componente).data("url-articulo")
  contenedor = $('<div >',{ class: "modal-body row" })
  tipos = $('<ul/>',{ class: "list-group", style: "overflow:hidden; overflow-y:scroll; height:450px;" })
  contMenu = $('<div/>',{class: "col-md-2" })
  contArticulo = $('<div />',{class: "col-md-10 contArticulo"})
  $.getJSON url, (e)->
    $.each e , (index,item)->
      li = $('<li/>',{
        class:"list-group-item"
        html: item.dentipart
        id:item.codtipart
      }).appendTo(tipos)
      li.on "click" ,()->
        data = 
        url: urlarticulo
        data:  
          'tipoarticulo': item.codtipart
        type: 'get'
        dataType: 'HTML'
        success: (data) ->
          # dibujo el contenedor y el buscador jejejeje
          contArticulo.empty()
          contArticulo.append data 
          return 
        $.ajax data

  contMenu.append tipos
  contenedor.append contMenu
  contenedor.append contArticulo
  return contenedor
################################################################

$(document).on 'click', '#prueba', (e) ->
  body = tipoArticulos(this)
  header = $(this).crearHear("Seleccionar ")
  modal = $(this).crearVentana header,body,$(this).footer(null,null)  
  modal.modal('show')
  return  
 
