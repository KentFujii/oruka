# frozen_string_literal: true

RSpec.describe Oruka do
  it "has a version number" do
    expect(defined?(Oruka::VERSION)).to be_truthy
  end

  it "has a configuration" do
    expect(defined?(Oruka::Configuration)).to be_truthy
  end
end
