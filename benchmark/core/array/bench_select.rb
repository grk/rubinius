require 'benchmark'
require 'benchmark/ips'

Benchmark.ips do |x|
  strings = ('a'..'j').to_a
  numbers = [-4, -81, 0, 5, 12, -1_000_000, 1, 10, 100, 1000]

  x.report "select string" do |times|
    i = 0
    while i < times
      a = strings.dup
      a.select { |v| v > 'd' }
      i += 1
    end
  end

  x.report "select numbers" do |times|
    i = 0
    while i < times
      a = numbers.dup
      a.select { |v| v > 10 }
      i += 1
    end
  end
end
