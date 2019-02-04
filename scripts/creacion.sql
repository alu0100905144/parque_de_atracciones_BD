-- -----------------------------------------------------
-- Table "empleadosajenos"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "empleadosajenos" (
  "dni" INT NOT NULL,
  "labor" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("dni"))
;


-- -----------------------------------------------------
-- Table "zona"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "zona" (
  "id" INT NOT NULL,
  "nombre" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"))
;


-- -----------------------------------------------------
-- Table "entrada"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "entrada" (
  "tipo" VARCHAR(45) NOT NULL,
  "precio" DECIMAL(10,2) NOT NULL,
  "id_zona" INT NOT NULL,
  PRIMARY KEY ("tipo", "id_zona"),

  CONSTRAINT "fk_zona"
    FOREIGN KEY ("id_zona")
    REFERENCES "zona" ("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;
CREATE INDEX "fk_zona_idx" ON "entrada" ("id_zona" ASC);

-- -----------------------------------------------------
-- Table "visitantes"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "visitantes" (
  "edad" INT NOT NULL,
  "nombre" VARCHAR(45) NOT NULL,
  "dni" INT NOT NULL,
  PRIMARY KEY ("dni"))
;


-- -----------------------------------------------------
-- Table "parcela"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "parcela" (
  "coord_x" DECIMAL(10,2) NOT NULL,
  "coord_y" DECIMAL(10,2) NOT NULL,
  "area" DECIMAL(10,2) NOT NULL,
  "tipo_parcela" VARCHAR(45) NOT NULL,
  "precio" VARCHAR(45) NULL DEFAULT NULL,
  "id_zona" INT NOT NULL,
  PRIMARY KEY ("coord_x", "coord_y"),

  CONSTRAINT "fk_zona"
    FOREIGN KEY ("id_zona")
    REFERENCES "zona" ("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

 CREATE INDEX "fk_zona_idx" ON "parcela" ("id_zona" ASC);
-- -----------------------------------------------------
-- Table "atraccion"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "atraccion" (
  "id" INT NOT NULL,
  "nombre" VARCHAR(45) NOT NULL,
  "capacidad" INT NOT NULL,
  "tipo" VARCHAR(45) NOT NULL,
  "VIP" VARCHAR(45) NOT NULL,
  "abierto" VARCHAR(45) NOT NULL,
  "coord_x" DECIMAL(10,2) NOT NULL,
  "coord_y" DECIMAL(10,2) NOT NULL,
  PRIMARY KEY ("id"),

  CONSTRAINT "fk_coordx"
    FOREIGN KEY ("coord_x")
    REFERENCES "parcela" ("coord_x")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_coordy"
    FOREIGN KEY ("coord_y")
    REFERENCES "parcela" ("coord_y")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;
  CREATE INDEX "fk_coordx_idx" ON "atraccion" ("coord_x" ASC);
  CREATE INDEX "fk_coordy_idx" ON "atraccion" ("coord_y" ASC);

-- -----------------------------------------------------
-- Table "revision"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "revision" (
  "resultado" VARCHAR(45) NOT NULL,
  "fecha" timestamp NOT NULL,
  "descripcion" VARCHAR(45) NULL DEFAULT NULL,
  "id_atraccion" INT NOT NULL,
  PRIMARY KEY ("fecha", "id_atraccion"),

  CONSTRAINT "fk_atraccion"
    FOREIGN KEY ("id_atraccion")
    REFERENCES "atraccion" ("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;
  CREATE INDEX "fk_atraccion_idx" ON "revision" ("id_atraccion" ASC);

-- -----------------------------------------------------
-- Table "empresas"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "empresas" (
  "cod" INT NOT NULL,
  "nombre" VARCHAR(45) NOT NULL,
  "telefono" INT NOT NULL,
  "e-mail" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("cod"))
;


-- -----------------------------------------------------
-- Table "puestos"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "puestos" (
  "nombre" VARCHAR(45) NOT NULL,
  "tipo" VARCHAR(45) NOT NULL,
  "cod_empresa" INT NOT NULL,
  PRIMARY KEY ("nombre", "cod_empresa"),

  CONSTRAINT "fk_codigo"
    FOREIGN KEY ("cod_empresa")
    REFERENCES "empresas" ("cod")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;
  CREATE INDEX "fk_codigo_idx" ON "puestos" ("cod_empresa" ASC);

-- -----------------------------------------------------
-- Table "empleado_ajeno_zona"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "empleado_ajeno_zona" (
  "dni" INT NOT NULL,
  "fecha" timestamp NOT NULL,
  "id_zona" INT NOT NULL,
  PRIMARY KEY ("dni", "fecha", "id_zona"),

  CONSTRAINT "fk_dni"
    FOREIGN KEY ("dni")
    REFERENCES "empleadosajenos" ("dni")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_zona"
    FOREIGN KEY ("id_zona")
    REFERENCES "zona" ("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

  CREATE INDEX "fk_zona_idx" ON "empleado_ajeno_zona" ("id_zona" ASC);
-- -----------------------------------------------------
-- Table "visitante_entrada"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "visitante_entrada" (
  "dni" INT NOT NULL,
  "fecha_compra" timestamp NOT NULL,
  "fecha_caducidad" timestamp NOT NULL,
  "importe" DECIMAL(10,2) NOT NULL,
  "id_zona" INT NOT NULL,
  "tipo_entrada" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("dni", "fecha_compra", "id_zona", "tipo_entrada"),

  CONSTRAINT "fk_dni"
    FOREIGN KEY ("dni")
    REFERENCES "visitantes" ("dni")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_zona"
    FOREIGN KEY ("id_zona")
    REFERENCES "entrada" ("id_zona")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_tipo"
    FOREIGN KEY ("tipo_entrada")
    REFERENCES "entrada" ("tipo")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

  CREATE INDEX "fk_zona_idx" ON "visitante_entrada" ("id_zona" ASC);
  CREATE INDEX "fk_tipo_idx" ON "visitante_entrada" ("tipo_entrada" ASC);
-- -----------------------------------------------------
-- Table "revisor"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "revisor" (
  "fecha" timestamp NOT NULL,
  "id_atraccion" INT NOT NULL,
  "dni_revisor" INT NOT NULL,
  PRIMARY KEY ("fecha", "id_atraccion", "dni_revisor"),

  CONSTRAINT "fk_fecha"
    FOREIGN KEY ("fecha")
    REFERENCES "revision" ("fecha")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_atraccion"
    FOREIGN KEY ("id_atraccion")
    REFERENCES "revision" ("id_atraccion")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

  CREATE INDEX "fk_atraccion_idx" ON "revisor" ("id_atraccion" ASC);
-- -----------------------------------------------------
-- Table "parcela_alquiler"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "parcela_alquiler" (
  "coord_x" DECIMAL(10,2) NOT NULL,
  "coord_y" DECIMAL(10,2) NOT NULL,
  "fecha_ini" timestamp NOT NULL,
  "fecha_fin" timestamp NOT NULL,
  "cod_empresa" INT NOT NULL,
  "nombre_puesto" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("coord_x", "coord_y"),

  CONSTRAINT "fk_puesto"
    FOREIGN KEY ("nombre_puesto")
    REFERENCES "puestos" ("nombre")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_cod"
    FOREIGN KEY ("cod_empresa")
    REFERENCES "puestos" ("cod_empresa")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_coordx"
    FOREIGN KEY ("coord_x")
    REFERENCES "parcela" ("coord_x")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "fk_coord_y"
    FOREIGN KEY ("coord_y")
    REFERENCES "parcela" ("coord_y")
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

  CREATE INDEX "fk_puesto_idx" ON "parcela_alquiler" ("nombre_puesto" ASC);
  CREATE INDEX "fk_cod_idx" ON "parcela_alquiler" ("cod_empresa" ASC);
  CREATE INDEX "fk_coord_y_idx" ON "parcela_alquiler" ("coord_y" ASC);
