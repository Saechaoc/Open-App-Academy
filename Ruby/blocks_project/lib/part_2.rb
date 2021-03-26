def all_words_capitalized?(array)
    array.all? {|str| str[0] == str[0].upcase && str[1...str.length] == str[1...str.length].downcase}
end


def no_valid_url?(array)
   not_valid = ['.com', '.net', '.io', '.org']
   array.none? do |url|
        not_valid.any? {|ele| url.end_with?(ele)}
   end
end


def any_passing_students?(array)
    array.any? {|student| student[:grades].reduce(&:+)/student[:grades].count >= 75}
end