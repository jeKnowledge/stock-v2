class WaitingQueueController < ApplicationController

  def new
  end

  def create
    @waiting_queue = WaitingQueue.new(waiting_queue_params)

    if @waiting_queue.save
      flash[:success] = "You are in waiting queue"
      redirect_to '/items_not_available'
    else
      flash[:danger] = "Try later"
      redirect_to '/items_not_available'
    end
  end

  def destroy
    @waiting_queue = WaitingQueue.find(params[:id])
    @waiting_queue.destroy
    flash[:success] = "You aren't in wainting queue"
    redirect_to '/items_not_available'
  end

  private

  def waiting_queue_params
    params.require(:waiting_queue).permit(:user_id, :item_id)
  end

end
