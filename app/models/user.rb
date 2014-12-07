class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :pins
  has_many :interestizations
  has_many :interests, through: :interestizations

  serialize :countries_to_see

  def first_name
  	name.split(' ').first
  end

  def admin?
    self.email == 'andrewpham74@gmail.com' or self.email == 'jessicapham74@gmail.com'
  end
end