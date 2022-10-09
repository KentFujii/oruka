module Oruka
  module Builder
    class Input
      class << self
        # def build(name: '', tasks: {})
        #   dag = Struct.new("Dag", :name, :tasks) do
        #     def content
        #       export = {
        #         "_export": {
        #           "rb": {
        #             "require": Rails.root.join('config/environment').to_s
        #           }
        #         }
        #       }.freeze
        #       JSON.pretty_generate(export.merge(tasks))
        #     end
        #   end
        #   dag.new(name, tasks)
        # end
      end
    end

    class  Filters
      class << self
      end
    end

    class Output
      class << self
      end
    end
  end
end