class WaitingQueueController < ApplicationController

  def new
  end

  def create
    @waiting_queue = WaitingQueue.new(waiting_queue_params)
    items = Item.all

    items.each do |i|
      if i.name.eql?Item.find(@waiting_queue.item_id).name
        @waiting_queue = WaitingQueue.new(waiting_queue_params)
        @waiting_queue.item_id = i.id
        @waiting_queue.save
      end
    end
    flash[:success] = "You are in waiting queue"
    redirect_to '/items_not_available'

  end

  def destroy
    waiting_queue_all = WaitingQueue.all
    @waiting_queue = WaitingQueue.find(params[:id])

    waiting_queue_all.each do |w|
      if w.item_id = @waiting_queue.item_id and w.user_id == @waiting_queue.user_id
        w.destroy
      end
    end
    flash[:success] = "You aren't in wainting queue"
    redirect_to '/items_not_available'
  end

  private

  def waiting_queue_params
    params.require(:waiting_queue).permit(:user_id, :item_id)
  end

end
