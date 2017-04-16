class UserProfile < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :completed, :blocked]
  enum role: [:user, :admin, :superadmin]

  acts_enum_translable
end
