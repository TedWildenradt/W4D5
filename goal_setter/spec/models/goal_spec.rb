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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
