CREATE OR REPLACE FUNCTION funciona_fun()
  RETURNS trigger AS  
  $BODY$ 
  DECLARE resultado_ INT; 
  BEGIN 
  SELECT "resultado" INTO resultado_ FROM "revision" NATURAL JOIN "atraccion" WHERE NEW."id_atraccion" = "atraccion"."id";  
    UPDATE "atraccion" SET "abierto" = resultado_;  
    return new;
  END; 
  $BODY$ LANGUAGE plpgsql; 
 
 
 
CREATE TRIGGER funciona_trg 
  AFTER INSERT ON "revision"
  FOR EACH ROW EXECUTE PROCEDURE funciona_fun();



 CREATE OR REPLACE FUNCTION parcelas_grandes()
  RETURNS trigger AS  
  $BODY$ 
  BEGIN 
	UPDATE "parcela" SET precio = (precio * 1.2)
	WHERE area > 200;  
    return new;
  END; 
  $BODY$ LANGUAGE plpgsql; 
 
 
 
CREATE TRIGGER parcelagrande_20_porciento_mas 
  AFTER INSERT ON "revision"
  FOR EACH ROW EXECUTE PROCEDURE parcelas_grandes();