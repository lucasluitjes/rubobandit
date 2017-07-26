require 'parser/current'

path = ARGV.first

if !path || path.empty?
  puts "Usage: #{__FILE__} <input path> [output path]"
  exit!
end

original = File.read(path)

STDERR.puts "\nProcessing #{path}..."

result = original.dup

# apply regexes to random lines

[
  # add 1-3 spaces at the end of the line, just in case:
  [3,/\n/m, '#{\' \' * (rand(3) + 1)}\n'], 

  # helpfully convert multi-line comments into really-long-line comments
  [2, /(^[\t ]*#[^\n]*)(\n[\t ]*#[^\n]*)+/m, '#{m.gsub(/ *\n[\t ]*# */m," ")}']

  # TODO: add/remove parentheses from method signatures
].each do |improbability, regex, substitute|
  result.gsub!(regex) do |m|
    if rand(improbability) == 0
      eval("\"#{substitute}\"") 
    else
      m
    end
  end
end

# TODO: hook into source rewriter so we can randomly switch block styles

# make sure the result is functionally equivalent to the original, by comparing the ASTs

original_ast = Parser::CurrentRuby.parse(original)
quirky_ast = Parser::CurrentRuby.parse(result)

STDERR.puts "... finished. Output:\n\n"

if original_ast == quirky_ast
  if ARGV.size > 1
    # save the result!
    File.open(ARGV.last,'w') {|f| f.puts result}
  else
    puts result
  end
else
  STDERR.puts "#{result}\n\nWARNING: RESULT NOT FUNCTIONALLY EQUIVALENT TO ORIGINAL, NOT SAVING."
end

