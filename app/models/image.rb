class Image < ActiveRecord::Base
  #
  # Accesors
  #
  attr_accessible :image, :social_message_id
  
  #
  # Asocciations
  #
  belongs_to :social_message
  
  #
  # Uploaders
  #
  mount_uploader :image, ImageUploader
  
  def self.create_from_result(result)
    result.media.each do |media|
      result_image = self.new
      result_image.remote_image_url = media.media_url
      result_image.save!
    end
  end
end
