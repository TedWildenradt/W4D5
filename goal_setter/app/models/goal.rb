# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  body       :string           not null
#  user_id    :integer          not null
#  public     :boolean          not null
#  completed  :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  validates :body,:user_id,presence:true
  
  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User
end
