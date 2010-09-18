class ContactMailer < ActionMailer::Base
  default :from => "gu.ruby.sc@gmail.com"

  def contact(contact)
    @contact = contact
    mail :to => "gu.ruby.sc@gmail.com", :subject => "Novo email"
  end
end
