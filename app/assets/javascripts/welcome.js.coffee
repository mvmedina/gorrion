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


 