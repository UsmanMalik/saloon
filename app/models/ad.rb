class Ad < ActiveRecord::Base
  belongs_to :campaign
  has_many :fences

  	enum type: ['Notification Ad', 'Banner Ad', 'Fullscreen Ad']


     has_attached_file :ad_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	 validates_attachment_content_type :ad_image, content_type: /\Aimage\/.*\z/

end
