# frozen_string_literal: true

require 'optparse'

module Biscotti
  module CLI
    class OptParser
      def self.parse!(args)
        options = {}

        parser = OptionParser.new do |opts|
          opts.banner = 'Usage: bundle exec biscotti [--version] [--help] [--dictionary=/path/to/words.lst] <letters>'

          opts.on('-V', '--version', 'Print version info') do
            $stdout.puts("biscotti version #{Biscotti::VERSION}")
            exit(0)
          end

          opts.on('-D', '--dictionary=DICTIONARY', 'Path to the words list') do |dictionary|
            options[:dictionary] = dictionary
          end

          # TODO: Print dictionary
          # TODO: Minimum character count
          # TODO: Provide a custom dictionary
          # TODO: Output as a grouped list by word length
          # TODO: Verbose mode to emit more than just the list
          # TODO: Alternative formats mode: JSON, Yaml, Text (default)

          opts.on_tail('-h', '--help', 'Show this message') do
            warn(opts)
            exit(0)
          end
        end

        begin
          parser.parse!(args)
        rescue StandardError => e
          puts e.message

          exit(1)
        end

        options[:letters] = ARGV

        options
      end
    end
  end
end
