require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

    def get_page
      @page=Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    end

    def get_courses
      @page.css(".post")
 h2 title: @page.css(".post").first.css("h2").text
 em schedule: @page.css(".post").first.css("em").text
   p description: @page.css(".post").first.css("p").text
   
    end

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
