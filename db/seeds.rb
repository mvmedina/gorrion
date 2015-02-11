# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

usuario = Administracion::Usuario.new
usuario.username ='ADMIN'
usuario.cedula = 'ADMIN'
usuario.nombres = 'ADMIN'
usuario.apellidos = 'ADMIN'
usuario.celular = 'ADMIN'
usuario.telefono = 'ADMIN'
usuario.direccion= 'ADMIN'
usuario.email= 'ADMIN@ADMIN.COM'
usuario.password = '12345678'
usuario.password_confirmation = '12345678'
usuario.save


conUsuario = Administracion::Controlador.new
conUsuario.subject_class = 'Administracion::UsuariosController'
conUsuario.descripcion = 'Usuarios '
conUsuario.save 


Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':index', descripcion: "Permite Consulta Lista de Usuarios "}])

Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':show', descripcion: "Permite Consultar un Usuario "}])

Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':new', descripcion: "Permite Crear Usuarios "}])

Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':edit', descripcion: "Permite Editar los Datos de los Usuarios "}])

Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':create', descripcion: "Permite Guardar los Datos de Usuario Nuevo "}])

Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':update', descripcion: "Permite Guardar los Datos Editados de los Usuarios "}])
   
Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':destroy', descripcion: "Permite Eliminar un Usuario "}])
   
Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':permisos_usuario', descripcion: "Permite Visualizar los Permisos "}])
   
Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':add_permiso_usuario', descripcion: "Permite Agregar Permisos "}])

Administracion::Permiso.create([
		{ nombre: 'Usuario',controlador: conUsuario,
			accion: ':del_permiso_usuario', descripcion: "Permite Quitar Permisos "}])
  
   
  
  
  
  




  
  
