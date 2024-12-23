class PagesController < ApplicationController
  def home
  end

  def contact
    @contact = Contact.new(contact_params)
    if request.post? && @contact.save
      flash[:notice] = "Gracias por contactarnos. Te responderemos pronto."
      redirect_to root_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
