class Api::MessagesController < ApplicationController
  before_action :set_api_message, only: [:show, :edit, :update, :destroy]

  # GET /api/messages
  # GET /api/messages.json
  def index
    @api_messages = Api::Message.all
  end

  # GET /api/messages/1
  # GET /api/messages/1.json
  def show
  end

  # GET /api/messages/new
  def new
    @api_message = Api::Message.new
  end

  # GET /api/messages/1/edit
  def edit
  end

  # POST /api/messages
  # POST /api/messages.json
  def create
    @api_message = Api::Message.new(api_message_params)

    respond_to do |format|
      if @api_message.save
        format.html { redirect_to @api_message, notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @api_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @api_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/messages/1
  # PATCH/PUT /api/messages/1.json
  def update
    respond_to do |format|
      if @api_message.update(api_message_params)
        format.html { redirect_to @api_message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @api_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/messages/1
  # DELETE /api/messages/1.json
  def destroy
    @api_message.destroy
    respond_to do |format|
      format.html { redirect_to api_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_message
      @api_message = Api::Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_message_params
      params.require(:api_message).permit(:title, :message, :sound, :priority, :url, :url_title, :status, :message_errors)
    end
end
