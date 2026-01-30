class MessagesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource :conversation
    load_and_authorize_resource :message, through: :conversation
  
    def create
      @message = @conversation.messages.new(message_params)
      @message.sender = current_user
  
      if @message.save
        redirect_to @conversation.listing
      else
        @messages = @conversation.messages.order(:created_at)
        render "conversations/show", status: :unprocessable_entity
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:body)
    end
  end
  