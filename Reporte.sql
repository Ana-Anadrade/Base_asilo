
----REPORTE 
SELECT  EXTRACT(YEAR FROM SERVICIO.FECHA_DEL_SERVICIO) AS A?O,COUNT(PERSONA_DE_TERCERA_EDAD.CEDULA) AS CANTIDAD FROM SERVICIO 
    INNER JOIN DETALLES_DE_FACTURA ON SERVICIO.ID_SERVICIO =  DETALLES_DE_FACTURA.FK_ID_SERVICIO
    INNER JOIN PLANTILLA_DE_INGRESO ON PLANTILLA_DE_INGRESO.ID_PLANTILLA = DETALLES_DE_FACTURA.FKY_ID_PANTILLA
    INNER JOIN PERSONA_DE_TERCERA_EDAD ON PERSONA_DE_TERCERA_EDAD.CEDULA = PLANTILLA_DE_INGRESO.FKY_CEDULA
    GROUP BY  EXTRACT(YEAR FROM SERVICIO.FECHA_DEL_SERVICIO);

