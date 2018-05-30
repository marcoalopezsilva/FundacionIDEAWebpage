class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :confirmable

    #after_create :force_mail_confirmation

    #def force_mail_confirmation
        #self.send_confirmation_instructions
    #end

end
