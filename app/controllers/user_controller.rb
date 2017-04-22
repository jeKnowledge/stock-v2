class UserController < ApplicationController
  def new
  end

	def show
		User.find_by(params[:id]);
	end
end
