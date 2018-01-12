class Goal < ApplicationRecord
  belongs_to :resolution

  enum state: { active: 1, complete: 2, on_hold: 3  }
end
