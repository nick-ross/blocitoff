desc "This task is called by the Heroku scheduler add-on"
task :delete_todos :environment do
  Todo.where("created_at <= ?", Time.now - 2.minutes).destroy_all
end
