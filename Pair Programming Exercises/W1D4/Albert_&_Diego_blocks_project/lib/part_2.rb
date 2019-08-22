def all_words_capitalized?(arr)
    arr.all? {|word| word.capitalize == word}
end

def no_valid_url?(url)
    url.none? {|ending| ending.end_with?(".com", '.net', '.io', '.org')}
end

def any_passing_students?(students_arr)
    students_arr.any? {|student| (student[:grades].sum / (student[:grades].length * 1.0)) >= 75 }
end