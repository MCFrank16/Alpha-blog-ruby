class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update, :show]

    def new
        @user = User.new
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "User updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to the Alpha blog, you are signed up as #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def show
        @articles = @user.articles
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
