module Administracion::UsuariosHelper

	def usuario_permiso(controlador,usuario)
		contenido = []
		contenido.append usuario_permiso_titulo_tabla()
		controlador.permisos.each {|p| puts p.accion }
		contenido.append usuario_permiso_contenido(controlador,usuario)
		content_tag :table, class: "table table-striped" do |t|
			contenido.join.html_safe
		end 
	end

	def usuario_permiso_contenido(controlador,usuario)
		contenido = []
		controlador.permisos.each do |permiso|
			contenedor_td = []
			if usuario.permisos.find{|p| p.id == permiso.id}.nil?
				contenedor_td.append content_tag(:td,permiso.accion)
				contenedor_td.append content_tag(:td,permiso.descripcion)
				contenedor_td.append content_tag(:td,"Permiso Inactivo ")
				contenedor_td.append content_tag(:td,
					link_to("Activar", 
					administracion_usuario_permiso_add_path(usuario,permiso),
					class: "btn btn-default activar_permiso_usuario ",
					style: "padding: 1px 12px; ",
					method: :post,
					data: { confirm: 'Estas Seguro ?' } )
				)
			else
				contenedor_td.append content_tag(:td,permiso.accion)
				contenedor_td.append content_tag(:td,permiso.descripcion)
				contenedor_td.append content_tag(:td,"Permiso Activo  ")
				contenedor_td.append content_tag(:td,
					link_to("Desactivar", 
					administracion_usuario_permiso_del_path(usuario,permiso),
					class: "btn btn-default activar_permiso_usuario ",
					style: "padding: 1px 12px; ",
					method: :post,
					data: { confirm: 'Estas Seguro ?' } )
				)
			end 
			tr = content_tag :tr do |tr|
				contenedor_td.join.html_safe
			end 
			contenido.append tr 
		end 
		content_tag :tbody do |tbody|
			contenido.join.html_safe
		end 
	end 


	def usuario_permiso_titulo_tabla
		contenido = []
		contenido.append content_tag(:th,"Accion ")
		contenido.append content_tag(:th,"Descripcion")
		contenido.append content_tag(:th,"Estado")
		content_tag :thead do |thead|
			content_tag :tr do |tr|
				contenido.join.html_safe
			end 
		end 
	end 
end 