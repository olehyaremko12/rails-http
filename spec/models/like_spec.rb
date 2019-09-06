# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  likable_type :string
#  likable_id   :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

describe Like, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:likable) }
  end
end
