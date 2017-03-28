class User < ActiveRecord::Base
  belongs_to :school
  #USER_ROLE = ['Parent', 'Teacher', 'Student']
  USER_ROLE = {
      student: 'Student',
      teacher: 'Teacher',
      parent: 'Parent',


  }
  validates :user_name, uniqueness: true
  validates :password, confirmation: true
  attr_reader :password
  attr_accessor :password_confirmation
  validate :password_must_be_present

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  def User.encrypt_password(password, salt)
    Digest::SHA1.hexdigest(password + 'wibble' + salt)
  end

  def User.authenticate(user_name, password)
    if user= find_by_user_name(user_name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def full_name
    self.first_name + self.last_name
  end

  private
  def generate_salt
    self.salt= self.object_id.to_s + rand.to_s
  end

  def password_must_be_present
    errors.add(:password, 'password missing') unless hashed_password.present?
  end

end
