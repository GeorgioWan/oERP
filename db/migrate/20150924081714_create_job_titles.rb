class CreateJobTitles < ActiveRecord::Migration
  def change
    create_table :job_titles do |t|
      t.string :title,  	null: false, default: ""

      t.timestamps null: false
    end

    add_index :job_titles, :title, unique: true
  end
end
