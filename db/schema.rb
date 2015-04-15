# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150401151125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administracion_controladors", force: true do |t|
    t.string   "subject_class"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administracion_permiso_usuarios", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "permiso_id"
    t.boolean  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administracion_permisos", force: true do |t|
    t.string   "nombre"
    t.integer  "controlador_id"
    t.string   "accion"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administracion_usuarios", force: true do |t|
    t.string   "username",               limit: 15
    t.string   "cedula",                 limit: 10
    t.string   "nombres",                limit: 40
    t.string   "string",                 limit: 250
    t.string   "apellidos",              limit: 40
    t.string   "celular",                limit: 15
    t.string   "telefono",               limit: 15
    t.string   "direccion",              limit: 250
    t.boolean  "estado",                             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                              default: "",   null: false
    t.string   "encrypted_password",                 default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "administracion_usuarios", ["email"], name: "index_administracion_usuarios_on_email", unique: true, using: :btree
  add_index "administracion_usuarios", ["reset_password_token"], name: "index_administracion_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "sigesp_almacens", force: true do |t|
    t.string   "codemp"
    t.string   "codalm"
    t.string   "nomfisalm"
    t.string   "desalm"
    t.string   "telalm"
    t.string   "ubialm"
    t.string   "nomresalm"
    t.string   "telresalm"
    t.string   "coduniadm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_articulos", force: true do |t|
    t.string   "codemp"
    t.string   "codart"
    t.string   "denart"
    t.string   "codtipart"
    t.string   "codunimed"
    t.date     "feccreart"
    t.string   "obsart"
    t.float    "exiart"
    t.float    "exiiniart"
    t.float    "minart"
    t.float    "maxart"
    t.float    "reoart"
    t.float    "prearta"
    t.float    "preartb"
    t.float    "preartc"
    t.float    "preartd"
    t.date     "fecvenart"
    t.string   "codcatsig"
    t.string   "spg_cuenta"
    t.string   "sc_cuenta"
    t.float    "pesart"
    t.float    "altart"
    t.float    "ancart"
    t.float    "proart"
    t.float    "ultcosart"
    t.float    "cosproart"
    t.string   "fotart"
    t.float    "preartaaux"
    t.float    "preartbaux"
    t.float    "preartcaux"
    t.float    "preartdaux"
    t.string   "ultcosartaux"
    t.string   "float"
    t.float    "cosproartaux"
    t.string   "serart"
    t.string   "ubiart"
    t.string   "docart"
    t.string   "fabart"
    t.string   "codmil"
    t.string   "str_codact"
    t.string   "unimeddetal"
    t.float    "preartdetal"
    t.boolean  "bol_estart"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_cargoarticulos", force: true do |t|
    t.string "codart"
    t.string "codcar"
  end

  create_table "sigesp_cargos", force: true do |t|
    t.string   "codemp"
    t.string   "codcar"
    t.string   "dencar"
    t.string   "codestpro"
    t.string   "spg_cuenta"
    t.float    "procar"
    t.integer  "estlibcom"
    t.string   "formula"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_ctrl_requisicions", force: true do |t|
    t.string   "codemp"
    t.string   "coduac"
    t.string   "prefijo"
    t.integer  "valor"
    t.integer  "nro_final"
    t.integer  "maxlen"
    t.date     "ultfecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_cuenta_gastos", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.string   "codestpro1"
    t.string   "codestpro2"
    t.string   "codestpro3"
    t.string   "codestpro4"
    t.string   "codestpro5"
    t.string   "spg_cuenta"
    t.float    "monto"
    t.float    "montoaux"
    t.string   "codfuefin"
    t.string   "cod_servicio"
    t.string   "cod_sede"
    t.string   "cod_region"
    t.string   "str_codregionsedeservicio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_departamentos", id: false, force: true do |t|
    t.string "codemp"
    t.string "coddep"
    t.string "dendep"
    t.string "coddepp"
    t.string "nivel"
    t.string "codperresponsable"
  end

  create_table "sigesp_dt_articulos", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.string   "codart"
    t.float    "canart"
    t.string   "unidad"
    t.float    "monpre"
    t.float    "monart"
    t.integer  "orden"
    t.string   "codestpro1"
    t.string   "codestpro2"
    t.string   "codestpro3"
    t.string   "codestpro4"
    t.string   "codestpro5"
    t.string   "spg_cuenta"
    t.string   "estincite"
    t.string   "numdocdes"
    t.float    "monpreaux"
    t.float    "monartaux"
    t.string   "codalm"
    t.string   "cod_servicio"
    t.string   "cod_sede"
    t.string   "cod_region"
    t.string   "str_codregionsedeservicio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_dt_cargos", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.string   "codart"
    t.string   "codcar"
    t.float    "monbasimp"
    t.float    "monimp"
    t.float    "monto"
    t.string   "formula"
    t.float    "monbasimpaux"
    t.float    "monimpaux"
    t.float    "montoaux"
    t.string   "cod_servicio"
    t.string   "cod_sede"
    t.string   "cod_region"
    t.string   "str_codregionsedeservicio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_dts_cargos", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.string   "codser"
    t.string   "codcar"
    t.float    "monbasimp"
    t.float    "monimp"
    t.float    "monto"
    t.string   "formula"
    t.float    "monbasimpaux"
    t.float    "monimpaux"
    t.float    "montoaux"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_fuente_financiamientos", force: true do |t|
    t.string   "codemp"
    t.string   "codfuefin"
    t.string   "denfuefin"
    t.string   "expfuefin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_marcas", force: true do |t|
    t.integer  "id_marca"
    t.string   "str_idmarca"
    t.string   "str_descripcion"
    t.boolean  "bol_estatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_modelos", force: true do |t|
    t.integer "id_modelo"
    t.string  "str_idmarca"
    t.string  "str_idmodelo"
    t.string  "str_descripcion"
  end

  create_table "sigesp_personas", id: false, force: true do |t|
    t.string "codemp"
    t.string "codper"
    t.string "cedper"
    t.string "nomper"
    t.string "apeper"
    t.string "dirper"
  end

  create_table "sigesp_regions", id: false, force: true do |t|
    t.integer "seq_region"
    t.string  "str_descripcion"
    t.string  "str_codregion"
  end

  create_table "sigesp_sedes", id: false, force: true do |t|
    t.integer "seq_sede"
    t.string  "str_descripcion"
    t.string  "str_codsede"
    t.integer "int_region"
  end

  create_table "sigesp_servicios", id: false, force: true do |t|
    t.integer "seq_servicio"
    t.string  "str_descripcion"
    t.string  "str_codservicio"
  end

  create_table "sigesp_serviciosedes", id: false, force: true do |t|
    t.integer "int_servicio"
    t.integer "int_sede"
  end

  create_table "sigesp_solicitud_cargos", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.string   "codcar"
    t.string   "codestpro1"
    t.string   "codestpro2"
    t.string   "codestpro3"
    t.string   "codestpro4"
    t.string   "codestpro5"
    t.string   "spg_cuenta"
    t.float    "monobjret"
    t.float    "monret"
    t.string   "cod_pro"
    t.string   "ced_bene"
    t.string   "sc_cuenta"
    t.string   "formula"
    t.float    "monto"
    t.float    "monobjretaux"
    t.float    "monretaux"
    t.float    "montoaux"
    t.string   "codfuefin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_solicitud_tipos", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.boolean  "bol_compra"
    t.string   "coddepalmacen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_solicitud_users", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.string   "usuario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_solicituds", force: true do |t|
    t.string   "codemp"
    t.string   "numsol"
    t.string   "codtipsol"
    t.string   "coduniadm"
    t.string   "codfuefin"
    t.date     "fecregsol"
    t.string   "estsol"
    t.string   "consol"
    t.float    "monto"
    t.float    "monbasinm"
    t.float    "montotcar"
    t.string   "tipo_destino"
    t.string   "cod_pro"
    t.string   "ced_bene"
    t.string   "firnivsol"
    t.string   "firnivadm"
    t.string   "firnivpre"
    t.integer  "estapro"
    t.date     "fecaprsep"
    t.string   "codaprusu"
    t.float    "numpolcon"
    t.date     "fechaconta"
    t.date     "fechaanula"
    t.float    "monbasinmaux"
    t.float    "montotcaraux"
    t.float    "montoaux"
    t.string   "undadm"
    t.string   "destino"
    t.string   "cod_servicio"
    t.string   "cod_sede"
    t.string   "cod_region"
    t.string   "str_codregionsedeservicio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_spg_ep2s", force: true do |t|
    t.string   "codemp"
    t.string   "codestpro1"
    t.string   "codestpro2"
    t.string   "denestpro2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_spg_ep3s", force: true do |t|
    t.string   "codemp"
    t.string   "codestpro1"
    t.string   "codestpro2"
    t.string   "codestpro3"
    t.string   "denestpro3"
    t.string   "codfuefin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_tipo_articulos", force: true do |t|
    t.string   "codtipart"
    t.string   "dentipart"
    t.string   "obstipart"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_tipo_servicios", force: true do |t|
    t.string   "codtipser"
    t.string   "dentipser"
    t.string   "obstipser"
    t.string   "codmil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_tipo_solicituds", force: true do |t|
    t.string   "codtipsol"
    t.string   "dentipsol"
    t.string   "estope"
    t.string   "modsep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_unidad_administrativas", force: true do |t|
    t.string   "codemp"
    t.string   "coduniadm"
    t.string   "coduac"
    t.string   "denuniadm"
    t.integer  "estemireq"
    t.string   "codestpro1"
    t.string   "codestpro2"
    t.string   "codestpro3"
    t.string   "codestpro4"
    t.string   "codestpro5"
    t.string   "coduniadmsig"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_unidads", force: true do |t|
    t.string   "codunimed"
    t.string   "denunimed"
    t.float    "unidad"
    t.string   "obsunimed"
    t.string   "tiposep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
