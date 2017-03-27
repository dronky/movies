/if ARGV[0] != ''
	string = File.open('movies.txt', 'r'){ |file| file.read }
else string = File.open(ARGV[0], 'r'){ |file| file.read }
end
puts string/

class Film 
/dont know why i need this/
	def initialize (aLink, aName, aYear, aCountry, aPremiere, aGenre, aDuration, aRating, aCentralActor, aSecActors)
          @flink = aLink
          @fname = aName
          @fyear = aYear
          @fcountry = aCountry
          @fpremiere = aPremiere
          @fgenre = aGenre
          @fduration = aDuration
          @frating = aRating
          @fcentralActor = aCentralActor
          @fsecActors = aSecActors
    end
    def initialize (movie)
          @flink, @fname, @fyear, @fcountry, @fpremiere, @fgenre, @fduration, @frating, @fcentralActor, @fsecActors = *movie
    end
    def get_name
    	@fname
    end
end

File.foreach("movies.txt") { 
|line|
obj=Film.new(Array.new(line.split('|')))
if obj.get_name.include?("Max") 
	puts obj.get_name
end
}

