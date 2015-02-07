namespace :posts do
  desc "Validate Markdown documents"
  task :validate do
  end

  desc "Convert Markdown documents into database post entries"
  task :convert => :validate do
  end
end
