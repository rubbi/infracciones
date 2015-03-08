class CopsController < ApplicationController
  before_action :set_cop, only: [:show, :edit, :update, :destroy]

  # GET /cops
  # GET /cops.json
  def index
    @cops = Cop.all
    @hash = Gmaps4rails.build_markers(@cops) do |infra, marker|
          marker.lat  infra.latitud
            marker.lng  infra.longitud
#            marker.infowindow 'zaazazaza'
      end
  end

  # GET /cops/1
  # GET /cops/1.json
  def show
  end

  # GET /cops/new
  def new
    @cop = Cop.new
  end

  # GET /cops/1/edit
  def edit
  end

  # POST /cops
  # POST /cops.json
  def create
    @cop = Cop.new(cop_params)

    respond_to do |format|
      if @cop.save
        format.html { redirect_to @cop, notice: 'cop was successfully created.' }
        format.json { render :show, status: :created, location: @cop }
      else
        format.html { render :new }
        format.json { render json: @cop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cops/1
  # PATCH/PUT /cops/1.json
  def update
    respond_to do |format|
      if @cop.update(cop_params)
        format.html { redirect_to @cop, notice: 'cop was successfully updated.' }
        format.json { render :show, status: :ok, location: @cop }
      else
        format.html { render :edit }
        format.json { render json: @cop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cops/1
  # DELETE /cops/1.json
  def destroy
    @cop.destroy
    respond_to do |format|
      format.html { redirect_to cops_url, notice: 'cop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cop
      @cop = cop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cop_params
      params.require(:cop).permit(:nombre, :placa, :identificacion, :infraccion, :articulo, :sancion, :devolvio, :copia, :latitud, :longitud)

    end
end