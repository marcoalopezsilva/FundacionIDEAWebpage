class Publication < ApplicationRecord
    has_one_attached :image
    has_one_attached :document
    belongs_to :user

    validates :title, presence: true
    validates :description, presence: true
    validates :tag, presence: true
    validates :pub_date, presence: true

    #validate :image_type
    #validate :document_type

    def thumbnail
        return self.image.variant(resize: '300x300').processed
    end

    private

    def image_type
        if image.attached? == false
            errors.add(:image, "| No ha seleccionado la imagen de portada del documento")
        elsif !image.content_type.in?(%('image/jpeg image/png'))
            errors.add(:image, "| La imagen debe ser formato JPEG o PNG")
        end
    end

    def document_type
        if document.attached? == false
            errors.add(:image, "| No ha seleccionado el archivo de la publicación")
        elsif !document.content_type.in?(%('application/pdf'))
            errors.add(:image, "| El documento debe ser formato PDF")
        end
    end

end
