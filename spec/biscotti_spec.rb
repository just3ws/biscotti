# frozen_string_literal: true

RSpec.describe Biscotti do
  subject(:output) do
    described_class.find_words(
      input,
      dictionary: dictionary,
      min_word_length: min_word_length
    )
  end

  let(:input) { 'aadfgnno' }

  let(:dictionary) { described_class.load_dictionary(File.join(Dir.pwd, 'spec', 'fixtures', 'fandango.lst').freeze) }

  let(:min_word_length) { 2 }

  it 'has a version number' do
    expect(Biscotti::VERSION).not_to be nil
  end

  it 'finds 30 words' do
    expect(output.count).to eq(30)
  end

  it 'finds "fandango" in the list' do
    expect(output).to include('fandango')
  end

  it 'has no words shorter than minimum word length' do
    expect(output.all? { |word| word.length >= min_word_length }).to be(true)
  end

  it 'has no words longer than the list of letters' do
    expect(output.all? { |word| word.length <= input.length }).to be(true)
  end
end
