class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @contacts = Contact.all
    @numbers = []

  end

  def create
    @contacts = Contact.all
    @numbers = params.fetch("contact_telephones")
    @numbers.each do |number|
      @message = Message.new(message_params)
      @message.update({:to => number})
      @message.save
    end
      if @message.save
        flash[:notice] = "Your message was sent!"
        redirect_to root_path
      else
        render 'new'
      end
    end


  # def create
  #   @contacts = Contact.all
  #   @message = Message.new(message_params)
  #   @tos = []
  #   binding.pry
  #   if @message.save
  #     flash[:notice] = "Your message was sent!"
  #     redirect_to root_path
  #   else
  #     render 'new'
  #   end
  # end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end





end
