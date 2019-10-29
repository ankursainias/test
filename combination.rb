
require 'pry'
require 'active_support/core_ext/hash/indifferent_access'
class Combination

  @@start = Time.now

  def invalid?(str)
    str.nil? || !total_length(str) || zero_or_one(str)
  end

  def total_length(str)
      str.length == 10
  end

  def zero_or_one(str)
      str.split('').select{|a|(a == "0" || a == "1")}.length > 0
  end

  #number to letters mapping
  def given_pattern
      hsh = HashWithIndifferentAccess.new
      hsh["2"] = ["a", "b", "c"]
      hsh["3"] = ["d", "e", "f"]
      hsh["4"] = ["g", "h", "i"]
      hsh["5"] = ["j", "k", "l"]
      hsh["6"] = ["m", "n", "o"]
      hsh["7"] = ["p", "q", "r", "s"]
      hsh["8"] = ["t", "u", "v"]
      hsh["9"] = ["w", "x", "y", "z"]
      hsh
  end

  def file_path
    "dictionary.txt" # must be in current directory
  end

  def file_exist?(name)
    File.exist?(name)
  end

   # Read dictionary file and hold all values in a array
  def convert_to_ary
    raise "file #{file_path} not found" unless file_exist?(file_path)
    File.read(file_path).split.map(&:downcase)
  end

  def find_letter_keys(str)
    letters = given_pattern
    str.split("").map{|digit|letters[digit]}
  end

  def grouping(ary)
    ary.shift.product(*ary).map(&:join)
  end

  #arrange arragement
  def matches_result(key_pairs)
  final_ary = []
    key_pairs.each do |key, pairs|
      next if pairs.first.nil? || pairs.last.nil?
      pairs.first.product(pairs.last).each do |key_pair|
        final_ary << key_pair
      end
    end
    final_ary
  end

  # get matching records with words
  def matching_records(keys,words)
    results = {}
    key_len = keys.length # total numbers
    (2...key_len).to_a.each do |i|
      ary1 = keys[0..i]
      ary2 = keys[i + 1..key_len]
      next if ary1.length < 3 || ary2.length < 3
      grouping1 = grouping(ary1)
      next if grouping1.nil?
      grouping2 = grouping(ary2)
      next if grouping2.nil?
      results[i] = [(grouping1 & words), (grouping2 & words)] # get common values from arrays
    end
    results
  end

  # output verify
  def match_with_words(keys, words)
    (grouping(keys) & words).join(", ")
  end

  def self.test_output(number)
    ary = self.new.main(number)
    ary.each {|a|  print "#{[a].flatten.join(" ")}\n" }
    finish = Time.now
    print "Excution time => #{finish - @@start}s\n"
  end

  # enter point of a program
  def main(str)
    #return if number not valid
    return [] if invalid?(str)
    words = convert_to_ary
    keys = find_letter_keys(str)
    results = matching_records(keys,words)
    final_ary =  matches_result(results)
    final_ary << match_with_words(keys, words)
    final_ary
  end

end



