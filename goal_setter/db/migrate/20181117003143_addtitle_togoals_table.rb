class AddtitleTogoalsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :title ,:string ,null:false
  end
end
