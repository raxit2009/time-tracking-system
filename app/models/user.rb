class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  has_many :attendances
  validates :login, presence: true
  validates :first_name,presence: {message: "First Name can't be blank"}
  validates :last_name,presence: {message: "Last Name can't be blank"}
  validates :username,presence: {message: "Username can't be blank"}
  validates :username, format: { with: /\A[a-z]+\Z/, message: "Only one word allow not space no special character allow" }
  validates :username, uniqueness: true, if: -> { self.username.present? }
  validates_confirmation_of :password
  attr_accessor :login
  
  # Use for login with username and email
  def login=(login)
    @login = login
  end
  
  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
