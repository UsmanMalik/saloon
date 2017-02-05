require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

# jobs go below here.

scheduler.every '1m' do
  # do stuff
  Rails.logger.info "hello, it's #{Time.now}"
  # rake "notify:user"
end