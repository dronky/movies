#prepare
def convert_rating(f_num)
  return '*' * (f_num % 8 * 10).round
end

#file Opening
fname=ARGV[0]
fname= fname==nil ? "movies.txt" : fname
puts !File.exist?(fname) ? "#{fname} does not exist" : "#{fname} found. Opening..."
#file reading
films=[]
File.open(fname) do |record|
  record.each do |item|
    film_hash = Hash[[:film_link, :film_name, :film_year, :film_country, :film_premiere, :film_genre,
                      :film_duration, :film_rating, :film_centralActor, :film_secActors].zip(item.chomp.split('|'))]
    films.push(film_hash)
  end
end

long=[]
while long.size()!=5 do
  maximum=films[0][:film_duration].chomp(' min').to_i
  id=films[0].object_id
  films.each { |film|
    if (film[:film_duration].chomp(' min').to_i > maximum.to_i) && (long.index(film.object_id)==nil)
      maximum = film[:film_duration].chomp(' min')
      id=film.object_id
    end
  }
  long.push(id)
end
films.each { |film|
  if long.index(film.object_id)!=nil
    puts film[:film_name] + ' ' + film[:film_duration]
  end }
