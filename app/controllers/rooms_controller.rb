class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(updated_at: :desc)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.valid?
      @room.save
      redirect_to room_messages_path(@room)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
  
  def search
    @rooms = Room.search(params[:keyword])
  end

  private

  def room_params
    params.require(:room).permit(:year_id, :month_id, :capacity_id, :prefecture_id,:name, user_ids: [])
  end

end
