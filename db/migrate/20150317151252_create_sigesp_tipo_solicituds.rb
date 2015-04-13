class CreateSigespTipoSolicituds < ActiveRecord::Migration
  def change
    create_table :sigesp_tipo_solicituds do |t|
      t.string :codtipsol
      t.string :dentipsol
      t.string :estope
      t.string :modsep

      t.timestamps
    end
  end
end
