class CreateTableVersion < ActiveRecord::Migration
  def change
    create_table :table_versions do |t|
      t.string :type
      t.string :orgiation
    end
  end
end
