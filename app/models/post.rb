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
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }

end
