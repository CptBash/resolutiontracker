class Resolution < ApplicationRecord
  belongs_to :user
  has_many   :goals

  enum state: { active: 1, complete: 2, on_hold: 3  }

  def self.send_reminder(resolution)
    if resolution.active? #and resolution.spam_time.strftime("%I:%M%p") == Time.now.strftime("%I:%M%p")
      user = resolution.user
      UserMailer.resolution_reminder(resolution).deliver_now
    end
  end
end
