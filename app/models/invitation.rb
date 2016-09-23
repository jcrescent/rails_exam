class Invitation < ActiveRecord::Base
  belongs_to :user,  :foreign_key => "user_id", :class_name => "User"
  belongs_to :other_user, :foreign_key => "other_user_id", :class_name => "User"
end
