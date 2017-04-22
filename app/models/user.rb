class User < ApplicationRecord
  before_create :confirmation_token
  has_many :listings

  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, :message => "A-Z/a-z are the only allowed characters", :on => :create
  validates_length_of :name, :minimum => 4, :maximum => 15, :message => "Name must be at least 4 characters long and not longer than 15 characters"
  has_secure_password
  validates_format_of :phoneNum, :with => /\A\d{3}-\d{3}-\d{4}\z/, :message => "should of xxx-xxx-xxxx format"
  #validates_format_of :phoneNum, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed", :on => :create

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end


end
