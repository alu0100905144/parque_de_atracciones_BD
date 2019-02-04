INSERT INTO "empleadosajenos" 
            ("dni", 
             "labor") 
VALUES      (1111, 
             'Limpieza'); 

INSERT INTO "empleadosajenos" 
            ("dni", 
             "labor") 
VALUES      (2222, 
             'Animacion'); 

INSERT INTO "zona" 
            ("id", 
             "nombre") 
VALUES      (1, 
             'Norte'); 

INSERT INTO "zona" 
            ("id", 
             "nombre") 
VALUES      (2, 
             'Sur'); 

INSERT INTO "entrada" 
            ("tipo", 
             "precio", 
             "id_zona") 
VALUES      ('VIP', 
             9, 
             1); 

INSERT INTO "entrada" 
            ("tipo", 
             "precio", 
             "id_zona") 
VALUES      ('Estandar', 
             2, 
             2); 

INSERT INTO "visitantes" 
            ("edad", 
             "nombre", 
             "dni") 
VALUES      (8, 
             'Juan', 
             3333); 

INSERT INTO "visitantes" 
            ("edad", 
             "nombre", 
             "dni") 
VALUES      (9, 
             'Maria', 
             4444); 

INSERT INTO "parcela" 
            ("coord_x", 
             "coord_y", 
             "area", 
             "tipo_parcela", 
             "precio", 
             "id_zona") 
VALUES      (45.5, 
             30, 
             20, 
             'Alquiler', 
             NULL, 
             1); 

INSERT INTO "parcela" 
            ("coord_x", 
             "coord_y", 
             "area", 
             "tipo_parcela", 
             "precio", 
             "id_zona") 
VALUES      (45.5, 
             30.5, 
             20, 
             'No_alquiler', 
             '6', 
             2); 

INSERT INTO "atraccion" 
            ("id", 
             "nombre", 
             "capacidad", 
             "tipo", 
             "vip", 
             "abierto", 
             "coord_x", 
             "coord_y") 
VALUES      (1, 
             'Cocodrilo', 
             2, 
             'agua', 
             true, 
             true, 
             45.5, 
             30.5); 

INSERT INTO "atraccion" 
            ("id", 
             "nombre", 
             "capacidad", 
             "tipo", 
             "vip", 
             "abierto", 
             "coord_x", 
             "coord_y") 
VALUES      (2, 
             'Noria Luisa', 
             150, 
             'tierra', 
             false, 
             true, 
             45.5, 
             30.5); 

INSERT INTO "revision" 
            ("resultado", 
             "fecha", 
             "descripcion", 
             "id_atraccion") 
VALUES      (true, 
             '07:38, 11 December 2012', 
             NULL, 
             1); 

INSERT INTO "revision" 
            ("resultado", 
             "fecha", 
             "descripcion", 
             "id_atraccion") 
VALUES      (false, 
             '07:38, 11 December 2072', 
             'Tornillo suelto', 
             2); 

INSERT INTO "empresas" 
            ("cod", 
             "nombre", 
             "telefono", 
             "e-mail") 
VALUES      (1, 
             'ULS', 
             111222333, 
             'uls@gmail.com'); 

INSERT INTO "empresas" 
            ("cod", 
             "nombre", 
             "telefono", 
             "e-mail") 
VALUES      (2, 
             'OPM', 
             555444555, 
             'opm@gmail.com'); 

INSERT INTO "puestos" 
            ("nombre", 
             "tipo", 
             "cod_empresa") 
VALUES      ('Tira y golpea', 
             'minijuego', 
             1); 

INSERT INTO "puestos" 
            ("nombre", 
             "tipo", 
             "cod_empresa") 
VALUES      ('Come y traga', 
             'comida', 
             2); 

INSERT INTO "empleado_ajeno_zona" 
            ("dni", 
             "fecha", 
             "id_zona") 
VALUES      (1111, 
             '07:38, 11 December 2017', 
             1); 

INSERT INTO "empleado_ajeno_zona" 
            ("dni", 
             "fecha", 
             "id_zona") 
VALUES      (2222, 
             '07:38, 11 December 2019', 
             2); 

INSERT INTO "visitante_entrada" 
            ("dni", 
             "fecha_compra", 
             "fecha_caducidad", 
             "importe", 
             "id_zona", 
             "tipo_entrada") 
VALUES      (3333, 
             '07:38, 14 December 2012', 
             '07:38, 11 December 2012', 
             100, 
             1, 
             'VIP'); 

INSERT INTO "visitante_entrada" 
            ("dni", 
             "fecha_compra", 
             "fecha_caducidad", 
             "importe", 
             "id_zona", 
             "tipo_entrada") 
VALUES      (4444, 
             '07:38, 16 December 2012', 
             '07:38, 11 December 2012', 
             20, 
             2, 
             'Estandar'); 

INSERT INTO "revisor" 
            ("fecha", 
             "id_atraccion", 
             "dni_revisor") 
VALUES      ('07:39, 11 December 2012', 
             1, 
             5555); 

INSERT INTO "revisor" 
            ("fecha", 
             "id_atraccion", 
             "dni_revisor") 
VALUES      ('09:38, 11 December 2012', 
             2, 
             6666); 

INSERT INTO "parcela_alquiler" 
            ("coord_x", 
             "coord_y", 
             "fecha_ini", 
             "fecha_fin", 
             "cod_empresa", 
             "nombre_puesto") 
VALUES      (45.5, 
             30, 
             '07:38, 21 December 2012', 
             '07:38, 11 December 2012', 
             1, 
             'Tira y golpea'); 

INSERT INTO "parcela_alquiler" 
            ("coord_x", 
             "coord_y", 
             "fecha_ini", 
             "fecha_fin", 
             "cod_empresa", 
             "nombre_puesto") 
VALUES      (45.5, 
             30, 
             '07:38, 13 December 2012', 
             '07:38, 11 December 2012', 
             2, 
             'Come y traga'); 
