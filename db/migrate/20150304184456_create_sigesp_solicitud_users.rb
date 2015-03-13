class CreateSigespSolicitudUsers < ActiveRecord::Migration
  def change
    create_table :sigesp_solicitud_users do |t|
      t.string :codemp
      t.string :numsol
      t.string :usuario

      t.timestamps
    end
  end
end
