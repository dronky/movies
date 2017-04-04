require 'csv'
require 'ostruct'
require 'date'

#prepare
def film_toStr(x)
  x.each do |elem|
  puts "#{elem[:film_name]} (#{elem[:film_premiere]}); #{elem[:film_genre].tr(',','/')} - #{elem[:film_duration]}"
  end
end

#file Opening
fname=ARGV[0] || "movies.txt"
if !File.exist?(fname)
   "#{fname} does not exist"
    return
end
films=Array.new
CSV.read(fname, { :col_sep => '|' }).map{|film| films<<OpenStruct.new(:film_link=>film[0], :film_name=>film[1], :film_year=>film[2], :film_country=>film[3],
 :film_premiere=>film[4], :film_genre=>film[5], :film_duration=>film[6], :film_rating=>film[7], :film_director=>film[8], :film_secActors=>film[9])}

puts "Longest films:"
film_toStr(films.max_by(5){|film| film[:film_duration].to_i})
puts "\n10 newest comedies:"
comedies = Array.new
film_toStr(films.map.select{|film| film[:film_genre].include? "Comedy"}.sort_by{|film| film[:film_premiere]}[0..9])
puts "\nDirectors:"
directors = Array.new
puts films.map{|film| film[:film_director]}.uniq!.sort_by{|director| director.split(' ')[1]}
puts "\nNot usa films:"
p films.map.count{|film| film[:film_country]!="USA"}
puts "\nMonth statistic:"

Date::MONTHNAMES.map.drop(1).each do |mnth|
print "#{mnth}: " 
puts films.map.count{|film| if film[:film_premiere].split('-').size == 3
Date.parse(film[:film_premiere]).mon == Date.strptime(mnth,"%B").mon end}
end