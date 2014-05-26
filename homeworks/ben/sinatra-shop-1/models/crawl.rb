class Impressum
  @@chances = []
  @@no_chances = []
  attr_accessor :website_content, :postfach, :telefon
  def initialize(link, string_of_website)
    @link = link
    @website_content = string_of_website.downcase
    @postfach = self.contains_postfach?
    @telefon = self.contains_telefon?
  end

  def contains_postfach?
    if self.website_content.include? 'postfach'
      return true
    else
      return false
    end
  end

  def contains_telefon?
    if self.website_content.include? "tel"
      return true
    else
      return false
    end
  end

  def summary
    if @postfach
      @@changes.push "POSTFACH: #{@link}"
    elsif @telefon == false
      @@chances.push "TELEFON: #{@link}"
    else
      @@no_chances.push @link.to_s
    end
  end

end

class BingLinkExtractor
  attr_accessor :links
  require 'nokogiri'
  def initialize(url_array)
    @links = get_all_hrefs_nokogiri(url_array)
  end

  def get_all_hrefs_nokogiri(url_array)
    #page = self.get_location()
    #puts url_array
    cleaned_hrefs = []
    url_array.each do |url|
        doc = Nokogiri::HTML(open(url))
        links = doc.css('a')
        hrefs = links.map {|link| link.attribute('href').to_s}.uniq.sort.delete_if {|href| href.empty?}
        hrefs.each do |link|
          if link[0,4] == "http" and not link.include? "microsoft.com" and not link.include? "msn.com" and not link.include? "msn.de"
            cleaned_hrefs.push link
          end # if
        end #do
    end #do
    return cleaned_hrefs
  end
end

class Checker
  attr_accessor :impressum
  require "uri"
  require "open-uri"

  def initialize(url)
    begin
      website = URI.parse(url)
      website = website.read.downcase!
      @impressum = Impressum.new(url, website)
    rescue Exception => e
      puts "=========================Deine Mutta!"
      puts e
    end
  end

  def self.check_linklist(url_array)
    url_array.each do |url|
      Checker.new(url)
    end
  end

  def self.show_summary
    summary = Impressum.all
  end

end

class BingSearch
  attr_accessor :url_liste
  def initialize(first_word, second_word = "impressum")
    @query = first_word + "+" + second_word
    @url_liste = self.create_url_list(@query)
  end

  def create_url_list(query)
    number = 2
    url_list = []
    10.times do
      url_list.push "https://www.bing.com/search?q=#{query}&go=&qs=n&filt=all&pq=#{query}&sc=0-12&sp=-1&sk=&cvid=c445072f0933436aae9d5f2f9c1f2130&first=#{number}&FORM=PORE"
      number += 10
    end
    puts "URL Liste erstellt..."
    puts url_list
    url_list
  end
end

class Action
  def initialize(keyword)
    @keyword = keyword
  end

  def self.start(keyword)
    search = BingSearch.new(keyword)
    target_pages = BingLinkExtractor.new(search.url_liste)
    Checker.check_linklist(target_pages.links)
    result = [Impressum.chances, Impressum.no_chances]
  end
end

# linkliste = NokoChecker.new(url)

# linkliste.links.each do |link|
#     imprint = Checker.new(url)
#     puts imprint.impressum.summary
# end