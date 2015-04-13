class Sigesp::SolicitudsalmacensController < ApplicationController
	  before_action :set_sigesp_solicitud, only: [:show, :edit, :update, :destroy]

  # GET /sigesp/solicituds
  # GET /sigesp/solicituds.json
  def index
    @sigesp_solicituds = Sigesp::Solicitud.all
  end

  # GET /sigesp/solicituds/1
  # GET /sigesp/solicituds/1.json
  def show
  end

  # GET /sigesp/solicituds/new
  def new
    @sigesp_solicitud = Sigesp::Solicitud.new
  end

  # GET /sigesp/solicituds/1/edit
  def edit
  end

  # POST /sigesp/solicituds
  # POST /sigesp/solicituds.json
  def create
    @sigesp_solicitud = Sigesp::Solicitud.new(sigesp_solicitud_params)

    respond_to do |format|
      if @sigesp_solicitud.save
        format.html { redirect_to @sigesp_solicitud, notice: 'Solicitud was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sigesp_solicitud }
      else
        format.html { render action: 'new' }
        format.json { render json: @sigesp_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sigesp/solicituds/1
  # PATCH/PUT /sigesp/solicituds/1.json
  def update
    respond_to do |format|
      if @sigesp_solicitud.update(sigesp_solicitud_params)
        format.html { redirect_to @sigesp_solicitud, notice: 'Solicitud was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sigesp_solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sigesp/solicituds/1
  # DELETE /sigesp/solicituds/1.json
  def destroy
    @sigesp_solicitud.destroy
    respond_to do |format|
      format.html { redirect_to sigesp_solicituds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sigesp_solicitud
      @sigesp_solicitud = Sigesp::Solicitud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sigesp_solicitud_params
      params.require(:sigesp_solicitud).permit(:codemp, :numsol, :codtipsol, :coduniadm, :codfuefin, :fecregsol, :estsol, :consol, :monto, :monbasinm, :montotcar, :tipo_destino, :cod_pro, :ced_bene, :firnivsol, :firnivadm, :firnivpre, :estapro, :fecaprsep, :codaprusu, :numpolcon, :fechaconta, :fechaanula, :monbasinmaux, :montotcaraux, :montoaux, :undadm, :destino, :cod_servicio, :cod_sede, :cod_region, :str_codregionsedeservicio)
    end
end
