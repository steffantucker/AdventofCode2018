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

boxIds = []
File.foreach("./day2.inputs") { |x| boxIds.push(x.strip) }
puts "#{boxIds.length} box IDs"

calculateChecksum(boxIds)