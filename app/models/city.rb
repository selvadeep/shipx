class City < ApplicationRecord



def self.in_progess
page = Nokogiri::HTML(RestClient.get("https://www.latlong.net/category/cities-102-15.html"))
tables = page.search('table')

tables.search('tr,a,th')
title = tables.css('a')
output =  title.map {|element| element["title"]}.compact

title = tables.css('td')
title.each_with_index do |value,index|
title.delete(value) if value.to_s.include?("<a")
end


output.each_with_index do |value,index|
	index+=1
	a = output[index-1].split(",")
	b = title[index*2-2].children[0].to_s
	c = title[index*2-1].children[0].to_s

	City.create(name: a[0], state: a[1], country: a[2], lat: b, lng: c)

end


end

end
