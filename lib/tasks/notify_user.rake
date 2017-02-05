namespace :notify do
  desc "Rake task to push divisions"
  task :user => :environment do
    t = Division.trigger_divisions
    puts "#{Time.now} - Success!" + t.to_s
  end
end