# frozen_string_literal: true

require 'biscotti/version'

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

  def load_dictionary(dictionary_file)
    File.open(dictionary_file, 'r').readlines
  end

  def word_length_idx(words)
    words.group_by(&:length)
  end

  def find_words(input, min_word_length: 2, dictionary: [])
    # puts "#{dictionary.count} words in dictionary"

    letters = input.split('').sort

    letters_frequency_idx = Biscotti.letters_frequency_idx(letters)

    words = letters.count.downto(min_word_length).each_with_object([]) do |letter_count, w|
      w.concat(letters.permutation(letter_count).to_a.map(&:join))
    end

    letters_count = letters.count
    word_length_range = (min_word_length..letters_count).freeze

    words & dictionary
            .map(&:chomp)
            .select { |word| word_length_range.include?(word.length) }
            .map { |word| word.strip.downcase.split('') }
            .select { |word| (word - letters).empty? }
            .select { |word| word.all? { |l0| word.count { |l1| l1 == l0 } <= letters_frequency_idx[l0] } }
            .map(&:join)
  end
end
