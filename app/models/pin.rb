class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

    validates :image, presence: true
    validates :description, presence: true
    validates :continent, presence: true
    validates :country, presence: true
    
  has_many :interestizations
  has_many :interests, through: :interestizations

  def image_url
  	self.image.url
  end

  def as_json(options = {})
  	super(options.merge(methods: [:image_url]))
  end
end
