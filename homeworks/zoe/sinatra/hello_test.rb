require "sinatra"

get '/' do
	"Hello Web!"
end

get '/hi' do
	content = ""				# You have to write code blocks
	10.times do					# whose return value will be 
		content += "Hi Web!"	# posted on the webpage.
	end
	content
end

get '/posts/:id' do  # :id is a place holder
	#"This is post number #{params[:id]}." # for normal type in
	"<h1>This is post number #{params[:id]}.</h1>" # for HTML headline
end