namespace :profiling do
  TYPE = [:fast, :middle, :slow]

  namespace :stackprof do
    TYPE.each do |type|
      task type => :environment do
        Book.stack_profile(type)
      end

      task all: TYPE
    end
  end

  namespace :benchmark do
    TYPE.each do |type|
      task type => :environment do
        Book.benchmark(type)
      end

      task all: TYPE
    end
  end

  namespace :rubyprof do
    TYPE.each do |type|
      task type => :environment do
        puts '================='
        puts type
        GC.start
        Book.connection
        result = Book.ruby_profile(type)

        printer = RubyProf::FlatPrinter.new(result)
        printer.print(STDOUT, profile: type)
        #printer = RubyProf::MultiPrinter.new(result)
        #printer.print(path: 'tmp/profile', profile: type)
      end

      task all: TYPE
    end
  end
end
