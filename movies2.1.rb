#prepare
def convert_rating(f_num)
	return "*" * (f_num % 8 * 10 ).round
end
#file Opening
fname=ARGV[0] || "movies.txt"
if !File.exist?(fname)
   "#{fname} does not exist"
    return
end
#file reading
File.open(fname).each{|line|
a=line.split('|')
if a[1].include?("Max")
  puts "#{a[1]} has rating: "+convert_rating(a[7].to_f)
end
}
    	

