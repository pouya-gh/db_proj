namespace :db do
  task :backup do
    system "mysqldump -u root banks > #{Rails.root.to_s}/db/backup.sql"
  end

  task :restore do
    system "mysql -u root banks < #{Rails.root.to_s}/db/backup.sql"
  end
end