# Rails Girls 2
def import_file(file)
	puts "Reading File..."
	f = File.open(file, "r").read
	puts "File read!"
	return f
end

def parse_file(file)
	file = file.split(" ")
	return file
end

def create_histogramm(array)
	histo = Hash.new(0)
	array.each do |word|
		#if histo.has_key?(word)
			histo[word] += 1
		#else
		#	histo[word] = 1
		#end
	end
	return histo
end

f = import_file("my_text.txt")
f = parse_file(f)


histo = create_histogramm(f)

puts histo


