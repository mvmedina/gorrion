class CreateSigespUnidads < ActiveRecord::Migration
  def change
    create_table :sigesp_unidads do |t|
      t.string :codunimed
      t.string :denunimed
      t.double :unidad
      t.string :obsunimed
      t.string :tiposep

      t.timestamps
    end
  end
end
