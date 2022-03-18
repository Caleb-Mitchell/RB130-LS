class TextAnalyzer
  def process
    # your implementation
    file = File.open("sample_text.txt")
    yield(file.read.split("\n"))
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.count("") + 1 } paragraphs" }
analyzer.process { |file| puts "#{file.size} lines" }
analyzer.process { |file| puts "#{file.join(" ").split.size} words" }


# 3 paragraphs
# 15 lines
# 126 words
