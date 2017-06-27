class CreateMovieSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_searches do |t|

      t.timestamps
    end
  end
end
