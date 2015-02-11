class Administracion::UsuariosController < ApplicationController
  
  #load_and_authorize_resource

  before_action :set_administracion_usuario, 
             only: [:show, :edit, :update,:destroy, :permisos_usuario,
                    :add_permiso_usuario, :del_permiso_usuario,:password_edit, :password_save]

  #before_action :authenticate_usuario!

  # GET /administracion/usuarios
  # GET /administracion/usuarios.json
  def index
    @usuarios = Administracion::Usuario.search params[:page], params[:search], params[:sort]
  end
 
  # GET /administracion/usuarios/1
  # GET /administracion/usuarios/1.json
  def show

  end

  # GET /administracion/usuarios/new
  def new
    @administracion_usuario = Administracion::Usuario.new
  end

  # GET /administracion/usuarios/1/edit
  def edit
    @administracion_usuario.password_confirmation = @administracion_usuario.password
  end



  def password_edit

  end 

  def password_save
      respond_to do |format|
      if @administracion_usuario.update(usuario_params_change_password)
        format.html { redirect_to @administracion_usuario, notice: 'Usuario Contraseña Actualizada  .' }
        format.json { head :no_content }
      else
        format.html { render action: 'password_edit' }
        format.json { render json: @administracion_usuario.errors, status: :unprocessable_entity }
      end
    end

  end 


  # POST /administracion/usuarios
  # POST /administracion/usuarios.json
  def create
    @administracion_usuario = Administracion::Usuario.new(usuario_params)
    @administracion_usuario.password = '12345678'
    @administracion_usuario.password_confirmation= '12345678'
    respond_to do |format|
      if @administracion_usuario.save
        format.html { redirect_to @administracion_usuario, notice: 'Usuario fue correctamente creado.' }
        format.json { render action: 'show', status: :created, location: @administracion_usuario }
      else
        format.html { render action: 'new' }
        format.json { render json: @administracion_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administracion/usuarios/1
  # PATCH/PUT /administracion/usuarios/1.json
  def update
    respond_to do |format|
      if @administracion_usuario.update(usuario_params_update )
        format.html { redirect_to @administracion_usuario, notice: 'Usuario fue correctamente actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @administracion_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administracion/usuarios/1
  # DELETE /administracion/usuarios/1.json
  def destroy
    @administracion_usuario.destroy
    respond_to do |format|
      format.html { redirect_to administracion_usuarios_url }
      format.json { head :no_content }
    end
  end

  #Mostrar todo los permisos del usuario 
  def permisos_usuario
    @controladores = Administracion::Controlador.all
  end 
 

  def add_permiso_usuario
    @permiso = Administracion::Permiso.find(params[:permiso_id])
    @administracion_usuario.permisos 
    unless @administracion_usuario.permisos.find { |permiso| permiso == @permiso } 
      @permiso_usuario = Administracion::PermisoUsuario.new
      @permiso_usuario.usuario = @administracion_usuario
      @permiso_usuario.permiso = @permiso
      @permiso_usuario.save 
      flash[:notice] = "Permiso Activado "
    else
      flash[:notice] = "Este Permiso se Encuentra Asigando "
    end 
    respond_to do |format|
      format.html { redirect_to administracion_usuario_permisos_path(@administracion_usuario)}
      format.json { head :no_content }
    end
  end


  def del_permiso_usuario
    @permiso = Administracion::Permiso.find(params[:permiso_id])
    @permiso_usuario = @administracion_usuario.permiso_usuarios.find {
      |permiso| permiso.permiso == @permiso } 

    unless @permiso_usuario.nil?
      @permiso_usuario.destroy
      flash[:notice] = "Permiso Inactivo"
    else
      flash[:notice] = "Este Permiso No se Encuentra Asigando"
    end 

    respond_to do |format|
      format.html { redirect_to administracion_usuario_permisos_path(@administracion_usuario)}
      format.json { head :no_content }
    end

  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracion_usuario
      if params[:id].nil?
        @administracion_usuario = Administracion::Usuario.find(params[:usuario_id])
      else
        @administracion_usuario = Administracion::Usuario.find(params[:id])
      end
    end

    def usuario_params
      params.require(:administracion_usuario).permit(:cedula, :nombres, :apellidos,:email, :direccion, :telefono, :celular ,:username)
    end

    def usuario_params_update
      params.require(:administracion_usuario).permit(:nombres, :apellidos,:email, :direccion, :telefono, :celular)
    end

    def usuario_params_update
      params.require(:administracion_usuario).permit(:nombres, :apellidos,:email, :direccion, :telefono, :celular)
    end

    def usuario_params_change_password
      params.require(:administracion_usuario).permit(:password,:password_confirmation)
    end


end
