from collections import defaultdict

artist_dict = defaultdict(set)
with open("song_ids.txt", "r") as f:
    for line in f:
    	line = line.strip()
    	artist_id,song_id = line.split(',')
    	(artist_dict[artist_id]).add(song_id)

#print(artist_dict)
print("done reading")

with open("song_ids_clean.txt", "w") as f:
	for artist_id in artist_dict:
		for song_id in artist_dict[artist_id]:
			f.write(artist_id+","+song_id+'\n')

print("done writing")
