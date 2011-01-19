class UserTablesMigration < Sequel::Migration

  def up
    create_table :user_tables do
      primary_key :id
      Integer :user_id, :null => false, :index => true
      String :name, :null => false
      Integer :privacy, :null => false
    end

    alter_table(:user_tables) do
      add_index [:user_id, :privacy]
      set_column_default :privacy, 0
    end
  end

  def down
    drop_table :user_tables
  end

end