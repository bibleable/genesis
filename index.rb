require 'json'

books = ""
biblejson = JSON.parse(File.read("./bible.json"))

# Loop through and build the regex string 
# It is building the book title part of the regex string
# example: (genesis|exodus|leviticus) and so on

for i in 1..66
    if i == 1
        books = biblejson["#{i}"]["name"] 
    else
        books = books + "|" + biblejson["#{i}"]["name"] 
    end
end

# add further shorten titles of the bible 
# example (gen|ex|lev)

for i in 1..66
    books = books + "|" + biblejson["#{i}"]["shorten"] 
end

regex = "\\b(" + books + ")+(?:\\s+\\d+)?(?::\\d+(?:–\\d+)?(?:,\\s*\\d+(?:–\\d+)?)*)?"

puts regex
