# == Schema Information
# Schema version: 20110623162534
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  identifier :string(255)
#  username   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates_presence_of :identifier, :username, :email
  validates_uniqueness_of :identifier, :username, :email, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true
end
