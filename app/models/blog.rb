class Blog < ActiveRecord::Base
 	mount_uploader :image, ImageUploader
 	belongs_to :user
  has_many :comments, dependent: :destroy
 	validates :image , presence: true
    validates :title, presence: true,
                            length: { minimum: 5 }

        validates :content, presence: true,

                            length: { minimum: 5 }
  
   def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    where("lower(title) like ? OR title like ? OR content like ? OR lower(content) like ? ", "%#{search}%", "%#{search}%" , "%#{search}%", "%#{search}%")
	
  end

  def self.get_profile
  	  Profile.find_by_user_id(current_user)
  end

end
 