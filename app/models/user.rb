class User < ApplicationRecord
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, :message => "A-Z/a-z are the only allowed characters", :on => :create
  validates_length_of :name, :minimum => 4, :maximum => 15, :message => "Name must be at least 4 characters long and not longer than 15 characters"
  has_secure_password
  validates_format_of :phoneNum, :with => /\A\d{3}-\d{3}-\d{4}\z/, :message => "should of xxx-xxx-xxxx format"
  #validates_format_of :phoneNum, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed", :on => :create
end
