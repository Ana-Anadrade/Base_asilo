
--TRIGGER 
CREATE or REPLACE TRIGGER TG_SERVICIO
BEFORE
INSERT ON DETALLES_DE_FACTURA
FOR EACH ROW
DECLARE 
ESTADOS_D VARCHAR2 (50);
EXCEP EXCEPTION;
BEGIN   
SELECT ESTADO INTO ESTADOS_D FROM PLANTILLA_DE_INGRESO
WHERE  ID_PLANTILLA =:NEW.FKY_ID_PANTILLA ;
IF INSERTING THEN
    IF(ESTADOS_D = 'DEBIENDO') THEN
        RAISE EXCEP;
    END IF;
END IF;
EXCEPTION 
WHEN EXCEP THEN
RAISE_APPLICATION_ERROR(-20002,'EL CLIENTE NO PAGO SU ESTANCIA');
END TG_SEVICIO;   

