class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags


  has_attached_file :image,
                    :styles => { :standart => "1250x700>", :thumb => "44x44#" },
                    :default_url => "/images/default.png"

  validates_attachment :image, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/jpeg", "image/png"] },
                       :size => { :in => 0..35000.kilobytes }

  def s3_credentials
    { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

end
