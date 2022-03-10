class MessagesController < ApplicationController

  def show
    @recipient = User.find(params[:user_id])
    @messages = current_user.sent_messages.where(recipient_id: @recipient.id).
    or(current_user.received_messages.where(sender_id: @recipient.id)).order(createrd_at: :asc)
  end

  def send_message
    Message.create(message_params).merge(sender_id: current_user.id, recipient_id: params[:user_id])
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end

end
