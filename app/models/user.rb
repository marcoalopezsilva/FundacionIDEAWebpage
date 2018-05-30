class User < ApplicationRecord

    #Next line is not currently needed, but I will need it once I code for documents upload
    #has_many :project_documents

    after_initialize :init

    devise :invitable, :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :confirmable, :invite_for => 1.weeks

    enum role: [:editor, :admin]

    def init
        self.role ||= :editor
    end
    #after_create :force_mail_confirmation

    #def force_mail_confirmation
        #self.send_confirmation_instructions
    #end

end
