module Oruka
  class Run
    class << self
      def run
        Open3.popen3("java -jar /usr/local/bin/embulk.jar -h") do |_, o, e, _|
          o.each { |line| puts line }
          e.each { |line| puts line }
        end
      end
    end
  end
end
