#prepare
def film_toStr(x)
  x.each do |elem|
  puts "#{elem[:film_name]} (#{elem[:film_premiere]}); #{elem[:film_genre].split(',')*'/'} - #{elem[:film_duration]}"
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
     :film_rating, :film_Director, :film_secActors].zip(line.chomp.split('|')).to_h
end
puts "Longest films:"
film_toStr(films.max_by(5){|film| film[:film_duration].to_i})
puts "10 newest comedies"
comedies = Array.new
film_toStr(films.select{|film| film[:film_genre].include? "Comedy"}.sort_by{|film| film[:film_premiere]}[0..9])

# long=[]
# while long.size()!=5 do 
#   maximum=films[0][:film_duration].chomp(' min').to_i
#   id=films[0].object_id
#   films.each { |film|
#     if (film[:film_duration].chomp(' min').to_i > maximum.to_i) && (long.index(film.object_id)==nil)
#       maximum = film[:film_duration].chomp(' min')
#       id=film.object_id
#     end
#   }
#   long.push(id)
# end
# films.each { |film|
#   if long.index(film.object_id)!=nil
#     puts film[:film_name] + ' ' + film[:film_duration]
#   end }
