class School < ActiveRecord::Base
  has_many :courses
  has_many :users
  has_many :klasses
  validate :email
  validates :password, confirmation: true
  attr_reader :password
  attr_accessor :password_confirmation
  validate :password_must_be_present

  def school_list
    schools= School.all
    school_names =schools.collect { |school| [school.name, school.id] }
  end

  all_school = self.new
  USER_SCHOOL = all_school.school_list

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
      if school.hashed_password == encrypt_password(password, school.salt)
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
