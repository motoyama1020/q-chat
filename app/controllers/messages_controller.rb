class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @rooms = Room.includes(:users,:rooms, { image_attachment: :blob }).order(created_at: :desc)
    @messages = @room.messages.includes(:user, { image_attachment: :blob })
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.valid?
      @message.save
      redirect_to room_messages_path(@room)
    else
      @rooms = Room.includes(:users,:rooms, { image_attachment: :blob }).order(created_at: :desc)
      @messages = @room.messages.includes(:user, { image_attachment: :blob })
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
