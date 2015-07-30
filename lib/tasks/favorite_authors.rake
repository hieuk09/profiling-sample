namespace :favorite_authors do
  task benchmark: :environment do
    query = User::FavoriteAuthors.new(User.first)

    Benchmark.ips do |x|
      x.config(time: 5, warmup: 2)
      x.report('execute 2 queries')  { query.execute_2_queries }
      x.report('execute 1 query in raw sql')  { query.execute_1_query_sql }
      x.report('execute 1 query in arel')  { query.execute_1_query_arel }
      x.compare!
    end

    Benchmark.bmbm do |x|
      x.report('execute 2 queries')  { query.execute_2_queries }
      x.report('execute 1 query in raw sql')  { query.execute_1_query_sql }
      x.report('execute 1 query in arel')  { query.execute_1_query_arel }
    end
  end
end
