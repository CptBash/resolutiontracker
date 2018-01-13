task :send_reminders => :environment do
  Resolution.send_reminder
end
