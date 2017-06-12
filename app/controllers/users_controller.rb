class UsersController < ApplicationController
    def index
        @user = User.all
        @user_attendance = current_user.attendances
    end
    def login_detail
        user = User.find(params[:id])
        @user_attendance = user.attendances
    end
end
