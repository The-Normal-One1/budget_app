class CreateJoinTableGroupSpecification < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :specifications do |t|
      t.index [:group_id, :specification_id]
      t.index [:specification_id, :group_id]
    end
  end
end
