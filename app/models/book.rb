class Book < ActiveRecord::Base
  belongs_to :category

  def category_name
    category.try(:name)
  end

  def self.category_names_slow
    all.map(&:category_name).uniq.compact
  end

  def self.category_names_middle
    includes(:category).all.map(&:category_name).uniq.compact
  end

  def self.category_names_fast
    category_ids = uniq.pluck(:category_id)
    Category.where(id: category_ids).pluck(:name)
  end

  def self.stack_profile(type)
    output = "tmp/stackprof-cpu-#{type}.dump"
    StackProf.run(mode: :cpu, out: output, interval: 10) do
      send(run_method(type))
    end
  end

  def self.benchmark(type)
    Benchmark.bmbm(10) do |x|
      x.report(type)  { send(run_method(type)) }
    end
  end

  def self.ruby_profile(type)
    result = RubyProf.profile do
      send(run_method(type))
    end
  end

  private

  def self.run_method(method_type)
    "category_names_#{method_type}"
  end
end
