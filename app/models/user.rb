class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /.+@.+\..+/ }
  validates :password_hash, presence: true

  has_many :created_events, class_name: "Event"
  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user && @user.password == password
      @user
    end
  end
end



#   def change
#     create_table :users do |t|
# class CreateUsers < ActiveRecord::Migration
#       t.string :first_name, :null => false
#       t.string :last_name, :null => false
#       t.string :email, :null => false
#       t.date :birthdate, :null => false
#       t.string :password_digest, :null => false
#       t.timestamps
#     end
#     add_index :users, :email, :unique => true
#   end
# end
