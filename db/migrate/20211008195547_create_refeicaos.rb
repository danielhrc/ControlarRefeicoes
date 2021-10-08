class CreateRefeicaos < ActiveRecord::Migration[6.1]
  def change
    create_table :refeicaos do |t|
      t.string :tipo
      t.string :alimentos
      t.string :sentimento
      t.timestamp :hora

      t.timestamps
    end
  end
end
