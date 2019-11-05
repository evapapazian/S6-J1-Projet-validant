class ApplicationController < ActionController::Base


	def verif_user
    @users = User.find(params[:id])
    return current_user.id == @users.id
  end
end
