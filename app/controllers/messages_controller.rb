class MessagesController < ApplicationController
  # GET /messages
  def index
    current_trip = params[:trip_id]
    messages = Trip.find(current_trip).messages

    @messages = messages.map { |message|
      serializedData = {}
      serializedData[:message_id] = message.id
      serializedData[:content] = message.content
      serializedData[:user] = { "username": message.user.username , "user_id": message.user.id }
      serializedData
    }
    res = {"result": "success", "data": { "messages": @messages, "trip_id": current_trip }}
    render json: res
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      serializedData = {}
      serializedData[:message_id] = @message.id
      serializedData[:content] = @message.content
      serializedData[:created_at] = @message.created_at
      serializedData[:user] = { "username": @message.user.username, "user_id": @message.user.id }
      res = { "result": "success", "data": serializedData }
      render json: res, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:trip_id, :user_id, :content)
    end
end
