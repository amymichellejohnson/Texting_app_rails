class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "New contact has been added."
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  
  private

  def contact_params
    params.require(:contact).permit(:name, :telephone)
  end
end
