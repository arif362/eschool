class Invitation < ActiveRecord::Base
  validate :email
end
