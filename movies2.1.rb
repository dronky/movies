#prepare
def convert_rating(f_num)
	return "*" * (f_num % 8 * 10 ).round
end
#file Opening
fname=ARGV[0]
fname= fname==nil ? "movies.txt" : fname
puts !File.exist?(fname) ? "#{fname} does not exist" : "#{fname} found. Opening..."
#file reading
File.open(fname) do |record| 
  record.each do |item|
    film_link, film_name, film_year, film_country,film_premiere, film_genre,
    film_duration, film_rating,film_centralActor, film_secActors = item.chomp.split('|')
    if film_name.include?("Max")
    	puts "#{film_name} has rating: "+convert_rating(film_rating.to_f)
    end
  end
end 