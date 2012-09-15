require 'stringex'
desc "Create a new post"
task :new_post, :title do |t, args|
  mkdir_p './content/es/posts'
  args.with_defaults(:title => 'New Post')
  title = args.title

  filename = "#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"
  filenamePath = "./content/es/posts/#{filename}"

  if File.exist?(filenamePath)
    abort('rake aborted!') if ask("#{filenamePath} already exists. Want to overwrite?", ['y','n']) == 'n'
  end

  puts "Creating new post: #{filenamePath}"
  open(filenamePath, 'w') do |post|
    post.puts '---'
    post.puts "title: \"#{title}\""
    post.puts "created_at: #{Time.now}"
    post.puts "kind: article"
    post.puts "ci: \"/#{filename}/\"" 
    post.puts "published: false" 
    post.puts "---\n\n"
  end
end 


task :new_proyect, :titleES, :titleEN do |t, args|
  mkdir_p './content/es/portfolios'
  mkdir_p './content/en/portfolios'
  args.with_defaults(:titleES => 'New Spanish proyect')
  args.with_defaults(:titleEN => 'New English proyect')
  titleES = args.titleES
  titleEN = args.titleEN


  filenameES = "#{Time.now.strftime('%Y-%m-%d')}-#{titleES.to_url}.haml"
  filenameEN = "#{Time.now.strftime('%Y-%m-%d')}-#{titleEN.to_url}.haml"	

  filenamePathES = "./content/es/portfolios/#{filenameES}"
  filenamePathEN = 	"./content/en/portfolios/#{filenameEN}"	

  if File.exist?(filenamePathES)
    abort('rake aborted!') if ask("#{filenamePathES} already exists. Want to overwrite?", ['y','n']) == 'n'
  end

  if File.exist?(filenamePathEN)
    abort('rake aborted!') if ask("#{filenamePathEN} already exists. Want to overwrite?", ['y','n']) == 'n'
  end

  puts "Creating new Spanish post: #{filenamePathES}"
  open(filenamePathES, 'w') do |proyect|
    proyect.puts '---'
    proyect.puts "title: \"#{titleES}\""
    proyect.puts "created_at: #{Time.now}"
    proyect.puts "kind: portfolioES"
    proyect.puts "ci: \"/#{filenameEN}/\"" 
    proyect.puts "published: false" 
    proyect.puts "---\n\n"
  end

  puts "Creating new English post: #{filenamePathEN}"
  open(filenamePathEN, 'w') do |proyect|
    proyect.puts '---'
    proyect.puts "title: \"#{titleEN}\""
    proyect.puts "created_at: #{Time.now}"
    proyect.puts "kind: portfolioEN"
    proyect.puts "ci: \"/#{filenameEN}/\"" 
    proyect.puts "published: false" 
    proyect.puts "---\n\n"
  end
end 
