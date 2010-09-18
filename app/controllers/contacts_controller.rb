class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.create(params[:contact])
    if @contact.save
      ContactMailer.contact(@contact).deliver
      flash[:notice] = 'Mensagem enviada com sucesso!'
      redirect_to new_contact_path
    else
      @contact.save
      render :new
    end
  end

end
