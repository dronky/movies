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

#file reading
films=Array.new
File.readlines(fname).each do |line|
    films<<[:film_link, :film_name, :film_year, :film_country, :film_premiere, :film_genre, :film_duration,
     :film_rating, :film_Director, :film_secActors].zip(line.split('|')).to_h
end
puts "Longest films:"
film_toStr(films.max_by(5){|film| film[:film_duration].to_i})
puts "\n10 newest comedies:"
comedies = Array.new
film_toStr(films.map.select{|film| film[:film_genre].include? "Comedy"}.sort_by{|film| film[:film_premiere]}[0..9])
puts "\nDirectors:"
directors = Array.new
puts films.map{|film| film[:film_Director]}.uniq!.sort_by{|director| director.split(' ')[1]}
puts "\nNot usa films:"
p films.map.count{|film| film[:film_country]!="USA"}
