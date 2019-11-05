class UsersController < ApplicationController

before_action :authenticate_user!, only: [:show]
before_action :verif_user, only: [:show]

def index
@user = User.all 

end


def show

@user = User.find(current_user.id)
@event = Event.where(administrator: current_user.id)
end 



end
