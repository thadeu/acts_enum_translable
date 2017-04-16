class User < ApplicationRecord
  enum status: { inactive: 0, active: 1, blocked: 2 }
  enum visible: [:hide, :show]

  acts_enum_translable
end
