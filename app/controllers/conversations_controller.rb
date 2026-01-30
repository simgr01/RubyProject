class ConversationsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
  
    def show
      @conversation = Conversation.find(params[:id])
      @messages = @conversation.messages.active.order(:created_at)
      @message = Message.new
      
    end
  end
  