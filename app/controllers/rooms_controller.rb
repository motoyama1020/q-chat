class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :search_room, only: [:index, :search]

  def index
    @rooms = Room.all.order(created_at: :desc)
    set_product_column
    set_category_column
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
    @rooms = Room.search(params[:keyword]).order(created_at: :desc)
    @results = @p.result.includes(:prefecture)
  end

  private

  def room_params
    params.require(:room).permit(:year_id, :month_id, :capacity_id, :prefecture_id,:name, user_ids: [])
  end

  def search_room
    @p = Room.ransack(params[:q])
  end

  def set_room_column
    @room_prefecture = Room.select("prefecture").distinct
    @room_year = Room.select("year").distinct
    @room_month = Room.select("month").distinct
    @room_capacity = Room.select("capacity").distinct
  end

end
