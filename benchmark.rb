require "benchmark"
require './combination'


Benchmark.bm do |x|
	str = "54383893333"
	ary = [["m", "n", "o"], ["m", "n", "o"], ["t", "u", "v"]]
	key_pairs = {2=>[["mot", "not", "oot"], []], 3=>[["noun", "onto"], ["struck"]], 4=>[["motor", "nouns"], ["truck", "usual"]], 5=>[[], ["puck", "ruck", "suck"]], 6=>[[], ["taj"]]}
	keys =  [["m", "n", "o"],
					 ["m", "n", "o"],
					 ["t", "u", "v"],
					 ["m", "n", "o"],
					 ["p", "q", "r", "s"],
					 ["t", "u", "v"],
					 ["p", "q", "r", "s"],
					 ["t", "u", "v"],
					 ["a", "b", "c"],
					 ["j", "k", "l"]]				 
	obj = Combination.new

	words = obj.convert_to_ary

	x.report("invalid: ") {obj.invalid?(str)}
	x.report("is_nil: ") {obj.is_nil?(str)}
	x.report("total_length: ") {obj.total_length(str)}
	x.report("zero_or_one: ") {obj.zero_or_one(str)}
	x.report("given_pattern: ") {obj.given_pattern}
	x.report("file_path: ") {obj.file_path}
	x.report("file_exist: ") {obj.file_exist?(obj.file_path)}
	x.report("convert_to_ary: ") {obj.convert_to_ary}
	x.report("find_letter_keys: ") {obj.find_letter_keys(str)}
	x.report("grouping: ") {obj.grouping(ary)}
	x.report("matches_result: ") {obj.matches_result(key_pairs)}
	x.report("matching_records: ") {obj.matching_records(keys,words)}
	x.report("match_with_words: ") {obj.match_with_words(keys,words)}
	x.report("main: ") {obj.main(str)}
	x.report("test_output: ") {Combination.test_output(str)}
end