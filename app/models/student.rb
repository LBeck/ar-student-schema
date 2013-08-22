require_relative '../../db/config'
require 'Date'

class Student < ActiveRecord::Base
 # validates_format_of :email, :with => /@+\w\..{2,}/i, :on => :save
 validates :email, :format => { :with => /.+@+\w+\..{2,}/, :message => "Only valid emails allowed"}
 validates :email, :uniqueness => true
 validates :age, :numericality => {:greater_than => 4}
 validates :phone, :format => { :with => /\W?\d{3}\W?\s?\d{3}-?\d{4}.*/, :message => "Only valid phone numbers allowed"}


 def name
 	"#{first_name} #{last_name}"
 end
 
 def age
 	now =  Date.today
 	now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
 end


end
#  def self.create(!)
#  def self.all
#  def self.where(column_name, value)
#  def self.find(id)
#  def self.group_by(column_name)
#  def self.order_by(column_name)

# # allows you to access attributes w/ a attr_accessor
# # assigning value to a key
#  def []= ([:name] = value) => bob[:name] = "robert"

#  def save
# # like initialize but automates initialization
# # takes a hash
#  def assign_attributes(name:"bob", ...)
#  # checks whether instance has id of 'nil' which would imply that it hasn't been added to the database
#  #returns boolean
#  def new_record?

 # validations   validates:name
 # migrations: are snapshots of changes

# end