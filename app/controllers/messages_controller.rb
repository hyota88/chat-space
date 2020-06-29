class MessagesController < ApplicationController
  before_action :set_group


  def index
    @message  = Message.new 
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(messages_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] 
      render :index
    end
  end

  private

  def messages_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end


