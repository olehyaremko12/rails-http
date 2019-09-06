# frozen_string_literal: true

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

class UserProfile < ApplicationRecord
  belongs_to :user, inverse_of: :user_profile

  validates :birthday,
            :bio,
            :first_name,
            :last_name,
            :username, presence: true
end
