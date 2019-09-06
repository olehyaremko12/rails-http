# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :user_profile, dependent: :destroy, inverse_of: :user
  has_many :tweets,       dependent: :destroy

  accepts_nested_attributes_for :user_profile,
                                reject_if:     :all_blank,
                                allow_destroy: true
end
