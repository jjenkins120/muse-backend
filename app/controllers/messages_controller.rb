class MessagesController < ApplicationController

    def index
        messages = Message.all 
        render json: messages
    end

    def show
        message = Message.find(params[:id])
        render json: message
    end

    def create
        message = Message.create(message_params)
        render json: message
    end

    def update
        message = Message.find(params[:id])
        message.update(message_params)
        render json: message
    end

    def destroy
        message = Message.find(params[:id])
        message.destroy
        render json: { message: 'success'}
    end

    private

    def message_params
        params.require(:message).permit(:sender_id, :recipient_id, :content, :read, :replied)
    end

end