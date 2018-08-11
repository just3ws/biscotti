# frozen_string_literal: true

require 'pry'

require 'benchmark'
require 'awesome_print'

module Biscotti
  module_function

  def letters_frequency_idx(letters)
    Hash[
      letters
      .group_by { |x| letters.count { |y| x == y } }
      .flat_map do |k, v|
        v.uniq.map { |l| [l, k] }
      end
    ]
  end

  def library
    open('/usr/share/dict/words', 'r').readlines # .map { |word| word.strip.downcase.split('') }
  end

  def word_length_idx(words)
    words.group_by(&:length)
  end

  def find_words(input, min_word_length = 2)
    sources = library

    puts "#{sources.count} words in dictionary"

    letters = input.split('').sort

    letters_frequency_idx = Biscotti.letters_frequency_idx(letters)

    words = letters.count.downto(min_word_length).each_with_object([]) do |letter_count, words|
      words.concat(letters.permutation(letter_count).to_a.map(&:join))
    end

    dictionary = sources
                 .map(&:chomp)
                 .select { |word| word.length >= min_word_length }
                 .select { |word| word.length <= letters.count }
                 .map { |word| word.strip.downcase.split('') }
                 .select { |word| (word - letters).empty? }
                 .select { |word| word.all? { |l0| word.count { |l1| l1 == l0 } <= letters_frequency_idx[l0] } }
                 .map(&:join)

    output = dictionary & words
  end
end

RSpec.describe Biscotti do
  it 'has a version number' do
    expect(Biscotti::VERSION).not_to be nil
  end

  it 'does something useful' do
    min_word_length = 2

    input = 'fandango'

    output = []

    bmark = Benchmark.realtime do
      output = described_class.find_words(input)
    end

    ap [:bmark, bmark]

    puts "#{output.count} words in output"
    ap described_class.word_length_idx(output)

    # binding.pry
    # puts
  end
end
