class User < ApplicationRecord

    APPROVED_DOMAINS = ["fundacionidea.org.mx", "c-230.com"]

    #Next line is not currently needed, but I will need it once I code for documents upload
    #has_many :project_documents

    after_initialize :init

    devise :invitable, :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :confirmable, :validate_on_invite => true, :invite_for => 1.weeks

    enum role: [:editor, :admin]

    validates :email, presence: true, if: :domain_check

    def init
        self.role ||= :editor
    end

    def domain_check
        unless APPROVED_DOMAINS.any? { |word| email.end_with?(word)}
            errors.add(:email, "<- La cuenta de correo no pertenece a un dominio permitido. No es posible crear el usuario.")
            #NL is rolled-back when executed. This is problematic, because the user persists and has to be manually deleted.
            self.delete
        end
    end
    #after_create :force_mail_confirmation

    #def force_mail_confirmation
        #self.send_confirmation_instructions
    #end

end
