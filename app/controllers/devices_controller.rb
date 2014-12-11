class DevicesController < ApplicationController
    # On ajoute la méthode connect dans la liste des méthodes où on set le device au début
  before_action :set_device, only: [:show, :edit, :update, :destroy, :add_user, :turn, :turn2]

  # On saute une etape de securite si on appelle connect en JSON
  skip_before_action :verify_authenticity_token, only: [:connect, :add_user, :turn, :update, :turn2]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @device }
      else
        format.html { render action: 'new' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end

  # POST /devices/1/connect.json
  def connect
    # On crée un nouvel objet connection à partir des paramètres reçus
    @connection = Connection.new(connection_params)
    # On précise l'idée du Device est celle dans les paramètres de l'URL
    # Sinon on modifie connection_params pour rajouter device_id
    @connection.device_id = params[:id]

    respond_to do |format|
      if @connection.save
        format.json
      else
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

    # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def turn
    respond_to do |format|
      if @device.update(device_params)
        format.json
      else
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def turn2
    @device.update_attribute(:status, !@device.status)

    if @device.status
         flash[:notice] = "Device has been turned on!"
      else
         flash[:notice] = "Device has been turned off!"
    end

    redirect_to :back
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :status)
    end

    # def add_user_params
    #   params.require(:device).permit(:user_id)
    # end

    def connection_params
      params.require(:connect).permit(:user_id)
    end
end