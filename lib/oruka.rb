# frozen_string_literal: true

require_relative "oruka/version"
require "oruka/configuration"
require "oruka/builder"

module Oruka
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end
end
