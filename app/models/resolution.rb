class Resolution < ApplicationRecord
  belongs_to :user
  has_many   :goals

  enum state: { active: 1, complete: 2, on_hold: 3  }
end
