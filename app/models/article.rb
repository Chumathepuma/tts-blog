class Article < ApplicationRecord
	# associations
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_many :comments, dependent: :destroy
	belongs_to :user

	# validations
	validates :title, presence: true, length: { minimum: 5 }
	validates :text, presence: true, length: { minimum: 5 }
	
	# geocoder
	geocoded_by :address
  	after_validation :geocode
end
