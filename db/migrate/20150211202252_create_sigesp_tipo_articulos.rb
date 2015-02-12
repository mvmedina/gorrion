class CreateSigespTipoArticulos < ActiveRecord::Migration
  def change
    create_table :sigesp_tipo_articulos do |t|
      t.string :codtipart
      t.string :dentipart
      t.string :obstipart

      t.timestamps
    end
  end
end
