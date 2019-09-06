# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  username   :string
#  first_name :string
#  last_name  :string
#  birthday   :date
#  bio        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe UserProfile, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:bio) }
  end
end
