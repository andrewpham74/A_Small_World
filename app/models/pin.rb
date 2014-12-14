class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

    validates :image, presence: true
    validates :description, presence: true
    # validates :continent, presence: true
    # validates :country, presence: true
    
  has_many :interestizations
  has_many :interests, through: :interestizations

  def image_url
  	self.image.url
  end

  def username
  	self.user.name
  end

  def image_url=(url)
    self.image = open(url)
  end

  def sanitized_source
    if self.source
      url = URI.parse(self.source)

      url.host
    end
  end

  def as_json(options = {})
  	super(options.merge(methods: [:image_url, :username]))
  end
end
