class CreateSigespSolicituds < ActiveRecord::Migration
  def change
    create_table :sigesp_solicituds do |t|
      t.string :codemp
      t.string :numsol
      t.string :codtipsol
      t.string :coduniadm
      t.string :codfuefin
      t.date :fecregsol
      t.string :estsol
      t.string :consol
      t.float :monto
      t.float :monbasinm
      t.float :montotcar
      t.string :tipo_destino
      t.string :cod_pro
      t.string :ced_bene
      t.string :firnivsol
      t.string :firnivadm
      t.string :firnivpre
      t.integer :estapro
      t.date :fecaprsep
      t.string :codaprusu
      t.float :numpolcon
      t.date :fechaconta
      t.date :fechaanula
      t.float :monbasinmaux
      t.float :montotcaraux
      t.float :montoaux
      t.string :undadm
      t.string :destino
      t.string :cod_servicio
      t.string :cod_sede
      t.string :cod_region
      t.string :str_codregionsedeservicio

      t.timestamps
    end
  end
end
