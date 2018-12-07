def calculateChecksum(ids)
	twoLetterCount = 0
	threeLetterCount = 0
	letterCounts = Hash.new
	ids.each do |id|
		letterCounts.clear
		id.each_char do |letter|
			if(letterCounts.has_key? letter)
				letterCounts[letter] += 1
			else
				letterCounts[letter] = 1
			end
		end
		if (letterCounts.has_value? 2)
			twoLetterCount += 1
		end
		if (letterCounts.has_value? 3)
			threeLetterCount += 1
		end
	end
	puts "#{twoLetterCount} IDs with double letters"
	puts "#{threeLetterCount} IDs with triple letters"
	puts "Checksum: #{twoLetterCount * threeLetterCount}"
end

def findSimilars(ids)
	# get list of sums of the words
	# the assumption is that all letters but one are the same,
	# the sum of the characters will be within 27
	# other cases will also include the same letters but in a different order
	# which will be checked after
	
	# loop though, get sums of letters
	# add to a hash with word => sum
	# loop through sums
	#  compare each sum to others
	#  create list of words that are within 27 of each other
	# loop through other list
	#  compare to other words, keep count
	#  if count is less than needed count, drop word
	# assumption is only needed values will be left
	# prepare last word by dropping letters that are different

	counts = Hash.new
	for id in (0..ids.length) do
		sum = 0
		# might only work with enumerables
		sum = id.each_code(:+)
		counts[id] = sum
	end

	closeOnes = Hash.new
	for i in (0..counts.length) do
		closeCount = 0
		for j in (i..counts.length) do
			if (counts[i] + 27) > counts[j] && (counts[i] - 27) < counts[j]
				if closeCount == 0
					closeCount += 1
					# need the key, not the value
					closeOnes.keys[i]
			end
		end
	end
	puts counts
end

boxIds = []
File.foreach("./day2.inputs") { |x| boxIds.push(x.strip) }
puts "#{boxIds.length} box IDs"

#calculateChecksum(boxIds)
findSimilarIds(boxIds)
