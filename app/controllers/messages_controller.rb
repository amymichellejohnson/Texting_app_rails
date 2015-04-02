class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @contacts = Contact.all
  end

  def create
    @contacts = Contact.all
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
