class Publication < ApplicationRecord
    has_one_attached :image
    has_one_attached :document
    belongs_to :user

    def thumbnail
        return self.image.variant(resize: '300x300').processed
    end

end
