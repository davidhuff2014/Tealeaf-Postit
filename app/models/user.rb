# encoding: UTF-8

# setting up relationships to both posts and comments
class User < ActiveRecord::Base
  # include Sluggable
  include SluggableDaveJul

  has_many :posts
  has_many :comments
  has_many :votes

  # has_secure_password # manually hanlding validations for project
  has_secure_password validations: false # to turn off validations

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 3 }

  # after_validation :generate_slug!

  sluggable_column :username

  def two_factor_auth?
    !self.phone.blank?
  end

  def generate_pin!
    self.update_column(:pin, rand(10**6)) # random 6 digit number
  end

  def remove_pin!
    self.update_column(:pin, nil) # remove after we get it
  end

  def send_pin_to_twilio
    account_sid = 'my assigned sid'
    auth_token = 'my auth token'

    # set up a client to talke to the Twilio REST API
    client = Twilio::REST::Client.new(account_sid, auth_token)

    msg = "Hi, please input the pin to continue login: #{self.pin}"
    account = client.account
    message = account.sms.messages.create({:from => 'some phone', :to => 'some phone',  :body => msg})
  end

  def admin?
    self.role.to_s.to_sym == :admin
  end

  def moderator?
    self.role.to_s.to_sym == :moderator
  end

  # def generate_slug!
  #   the_slug = to_slug(self.username)
  #   user = User.find_by slug: the_slug
  #   count = 2
  #   while user && user != self
  #     the_slug = append_suffix(the_slug, count)
  #     user = User.find_by slug: the_slug
  #     count += 1
  #   end
  #   self.slug = the_slug.downcase
  #   # self.slug = self.title.sub(" ","-").downcase # prefer the following
  #   # self.slug = self.title.parameterize # rails way without gem
  # end

  # def append_suffix(str, count)
  #   if str.split('-').last.to_i != 0
  #     return str.split('-').slice(0...-1).join('-') + '-' + count.to_s

  #   else
  #     return str + '-' + count.to_s
  #   end
  # end

  # def to_slug(name)
  #   str = name.strip
  #   str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
  #   str.gsub! /-+/, '-'
  #   str.downcase
  # end

  # def to_param
  #   self.slug
  # end
end
