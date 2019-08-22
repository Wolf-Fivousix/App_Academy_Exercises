def all_words_capitalized?(words_array)
    words_array.all? {|word| word == word.capitalize}
end

def no_valid_url?(urls_array)
    valid = ["com", "net", "io", "org"]
    urls_array.none? {|url| valid.include?(url.split(".")[-1])}
end

def any_passing_students?(students_hashes_array)
    students_hashes_array.any? {|student| (student[:grades].sum / student[:grades].length) >= 75}
end