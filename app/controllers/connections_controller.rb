class ConnectionsController < ApplicationController
    # On ajoute la méthode connect dans la liste des méthodes où on set le device au début
  before_action :set_connection, only: [:show, :edit, :update, :destroy, :add_user, :turn]

  # On saute une etape de securite si on appelle connect en JSON
  skip_before_action :verify_authenticity_token, only: [:connect, :add_user, :turn]

  # GET /devices
  # GET /devices.json
  def index
    @connections = Connection.all
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
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

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

end