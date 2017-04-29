class Profile < ApplicationRecord
    include Placeholder
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular
        where(subtitle: 'Angular')
    end

    scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end

########################THIS LOGIC IS THE SAME AS LINE 13 ######################
# if self.main_image == nil
#     self.main_image = "http://placehold.it/600x400"
# end
################################################################################
