class School < ActiveRecord::Base
  has_many :course_klass_lists
  validate :email
  validates :password, confirmation: true
  attr_reader :password
  attr_accessor :password_confirmation
  validate :password_must_be_present

  def password=(password)
    @password=password
    if password.present?
      generate_salt
      self.hashed_password=self.class.encrypt_password(password, salt)
    end
  end

  def self.encrypt_password(password, salt)
    Digest::SHA1.hexdigest(password + 'wibble' + salt)
  end

  def self.authenticate(email, password)
    if school = find_by_email(email)
      if school.hashed_password == encrypt_password(password,school.salt)
        school
      end
    end
  end

  private
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def password_must_be_present
errors.add(:password, 'missing password') unless hashed_password.present?
  end

end
