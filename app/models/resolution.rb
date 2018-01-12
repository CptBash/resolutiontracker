class Resolution < ApplicationRecord
  belongs_to :user
  has_many   :goals

  enum state: { active: 1, complete: 2, on_hold: 3  }

  def self.send_reminder
    #will uncomment spam_time condition when cron is set up and ready to test on production
    resolutions = Resolution.where(state: 1)#, spam_time: Time.now.strftime("%I:%M%p"))
    resolutions.each do |resolution|
      user = resolution.user
      UserMailer.resolution_reminder(resolution).deliver_now
    end
  end
end
