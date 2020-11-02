require 'JWT'

class UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :password, :first_name, :last_name, :email, :bio, :location, :image_url]

    def index
        users = User.all 
        render json: users, include: '*.*'
    end

    def show
        user = User.find(params[:id])
        render json: user, include: '*.*'
    end

    def create
        user = User.create(user_params)
        render json: user

    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { message: 'success'}
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            payload = { user_id: user.id}
            token = JWT.encode(payload, 'S3cr3t', 'HS256')

            render json: {user: UserSerializer.new(user), token: token}
        else 
            render json: {error: "Spin again, friend. Invalid username or password"}
        end
    end

    def current_session
        token = request.headers[:Authorization].split(' ')[1]
        decoded_token = JWT.decode(token, 'S3cr3t', true, { algorithm: 'HS256' })
        user_id = decoded_token[0]['user_id']
    
        user = User.find(user_id)

        render json: {user: UserSerializer.new(user)}
    
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :bio, :location, :image_url)
    end

end
