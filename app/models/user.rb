class User < ActiveRecord::Base
  has_many :credential
end
