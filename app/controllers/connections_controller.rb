class ConnectionsController < ApplicationController
    # On ajoute la méthode connect dans la liste des méthodes où on set le connection au début
  before_action :set_connection, only: [:show, :edit, :update, :destroy]

  # On saute une etape de securite si on appelle connect en JSON
  skip_before_action :verify_authenticity_token, only: [:connect]

  # GET /connections
  # GET /connections.json
  def index
    @connections = Connection.all(:order => 'id ASC')
  end

  # GET /connections/1
  # GET /connections/1.json
  def show
  end

  # GET /connections/new
  def new
    @connection = Connection.new
  end

  # GET /connection/1/edit
  def edit
  end

  # POST /connections
  # POST /connections.json
  def create
    @connection = Connection.new(connection_params)

    respond_to do |format|
      if @connection.save
        format.html { redirect_to @connection, notice: 'Connection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @connection }
      else
        format.html { render action: 'new' }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1
  # PATCH/PUT /connections/1.json
  def update
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to @connection, notice: 'Connection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1
  # DELETE /connections/1.json
  def destroy
    @connection.destroy
    respond_to do |format|
      format.html { redirect_to connections_url }
      format.json { head :no_content }
    end
  end

  def set_connection
    @connection = Connection.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connection_params
      params.require(:connection).permit(:user_id, :device_id)
    end

end