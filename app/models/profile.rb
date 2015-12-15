class Profile < ActiveRecord::Base
mount_uploader :image, ImageUploader
has_one :user
end
