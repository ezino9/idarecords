class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      redirect_to root_path, notice: 'Your message sent!!'
    else 
      render 'new'
    end
  end

  private
  def params_contact
    params.require(:contact).permit(:name, :email, :message)
  end
end
