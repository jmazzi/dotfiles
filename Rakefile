desc "List untracked dot files"
task :untracked do
  sh "cd $HOME && find .* ! -type l -maxdepth 0"
end

desc "Download git submodules"
task :fetch_plugins do
  puts "Fetching plugins"
  system %Q{git submodule update --init}
end

desc "Update all installed plugins"
task :update do
  puts "Updating plugins"
  system "git submodule foreach 'git pull'"
  Rake::Task['helptags'].invoke
end

desc "Generate helptags"
task :helptags do
  puts "Generating helptags"
  sh "vim -e -c 'Helptags|q' 2>&1 /dev/null"
end
