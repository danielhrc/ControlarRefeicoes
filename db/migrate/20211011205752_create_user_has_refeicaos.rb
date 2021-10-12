class CreateUserHasRefeicaos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_has_refeicaos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :refeicao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
