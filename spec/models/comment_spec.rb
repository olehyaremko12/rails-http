# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  tweet_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Comment, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tweet) }
    it { is_expected.to have_many(:likes) }
  end
end
