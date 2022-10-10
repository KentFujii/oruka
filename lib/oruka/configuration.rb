module Oruka
  class Configuration
    attr_accessor :entrypoint

    def initialize
      @entrypoint = "embulk".freeze
    end
  end
end