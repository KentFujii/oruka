require 'active_support'

module Oruka
  class Builder
    class << self
      def build(exec: {}, input: {}, filters: [], output: {})
        etl = Struct.new('ETL', :input, :filters, :output) do
          def read
            {
              exec: exec.present? ? exec : nil,
              in: input,
              filters: filters.present? ? filters : nil,
              output: output
            }.compact
          end

          def open
            # generate tempfile
            # https://docs.ruby-lang.org/ja/latest/class/Tempfile.html
          end
        end
        etl.new(exec, input, filters, output)
      end
    end
  end
end
