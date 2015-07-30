class User::FavoriteAuthors
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def execute_2_queries
    author_ids = user.books.group(:author_id)
      .order('count_all DESC').limit(3).count.keys
    user.authors.where(id: author_ids)
  end

  def execute_1_query_sql
    user.authors.where(
      '
        authors.id IN (
          SELECT author_id FROM (
           SELECT COUNT(*) AS count_all, author_id AS author_id
           FROM "books"
           INNER JOIN "book_users" ON "books"."id" = "book_users"."book_id"
           WHERE "book_users"."user_id" = ?
           GROUP BY "books"."author_id"
           ORDER BY count_all DESC LIMIT 3
         ) AS favorite_authors
        )
      ', user.id
    )
  end

  def execute_1_query_arel
    user.authors.where(
      author_table[:id].in(
        book_table.project(:author_id).from(favorite_author_ids)
      )
    )
  end

  def author_table
    user.authors.arel_table
  end

  def book_table
    user.books.arel_table
  end

  def book_user_table
    BookUser.arel_table
  end

  def favorite_author_ids
    books.project(
      Arel.sql("COUNT(*)").as('count_all'),
      book_table[:author_id].as('author_id')
    ).group(book_table[:author_id])
      .order('count_all DESC')
      .take(3)
      .as('favorite_authors')
  end

  def books
    book_table.join(book_user_table)
      .on(book_table[:id].eq(book_user_table[:book_id]))
      .where(book_user_table[:user_id].eq(user.id))
  end
end
