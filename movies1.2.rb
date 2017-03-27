n=0
good=["Matrix","Titanic","8mile"]
for movie in good
	if ARGV[0]==movie
	puts movie + " is good movie"
	n+=1
end
end
if n==0
	puts ARGV[0] + " is bad movie"
end