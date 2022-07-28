SELECT
/**
SQL_1:
Lista los proyectos, actividades y tipos de proyecto y actividad para un tipo de 
proyecto específico
**/
        AB.NMIDTASK ID_PROYECTO,
        AB.NMTASK TITULO_PROYECTO,
		TB.CDTASKTYPE CD_TIPO_PROYECTO,
        (TB.IDTASKTYPE + ' - ' + TB.NMTASKTYPE) TIPO_PROYECTO,
        ATI.NMIDTASK ID_ACTIVIDAD,
        ATI.NMTASK TITULO_ACTIVIDAD,
		TA.CDTASKTYPE CD_TIPO_ACTIVIDAD,
        (TA.IDTASKTYPE + ' - ' + TA.NMTASKTYPE) TIPO_ACTIVIDAD,
		1 AS CANTIDAD
    FROM
        PRTASK AB  
    JOIN
        PRTASKTYPE TB 
            ON AB.CDTASKTYPE=TB.CDTASKTYPE  
    LEFT JOIN
        PRTASK ATI 
            ON ATI.CDBASETASK = AB.CDTASK 
    LEFT JOIN
        PRTASKTYPE TA 
            ON ATI.CDTASKTYPE=TA.CDTASKTYPE 
    WHERE
        AB.CDTASK = AB.CDBASETASK
		/** AND AB.NMIDTASK = '12366' **/ /** FILTRO POR ID DE PROYECTO **/
		AND TB.IDTASKTYPE = 'INV' /** FILTRO POR ID DE TIPO DE PROYECTO **/

/**
LA TABLA PRTASK CONTIENE TODOS LOS PROYECTOS Y ACTIVIDADES
LA TABLA PRTASKTYPE CONTIENE LOS TIPOS DE PROYECTOS Y ACTIVIDADES
ACTUALIZAR EL CAMPO CDTASKTYPE EN TABLA PRTASK
**/

 
/**
SQL_2:
Lista el código en la base de datos del tipo de actividad que 
se consulta.
**/
SELECT CDTASKTYPE FROM PRTASKTYPE WHERE IDTASKTYPE = 'ESCRIBIR AQUÍ EL ID DEL TIPO DE ACTIVIDAD QUE SE REQUIERE
APLICAR A LAS ACTIVIDADES DE PROYECTOS'


/**
SQL_3:
Lista el código en la base de datos del proyecto que se consulta
**/
SELECT CDTASK FROM PRTASK WHERE NMIDTASK = 'ESCRIBIR AQUÍ EL ID DEL PROYECTO EN CUYAS ACTIVIDADES SE REQUIERE ACTUALIZAR EL TIPO DE ACTIVIDAD'


/** 
SQL_4:
IMPORTANTE:
ESTA SQL DEBE SER EJECUTADA EN AMBIENTE QA ANTES DE EJECUTARSE 
EN AMBIENTE PRODUCTIVO.

SOFTEXPERT NO RECOMIENDA LA EJECUCIÓN DE COMANDOS EN LA BASE DE DATOS
QUE NO HAYAN SIDO CONSTRUÍDOS / VALIDADOS POR EL EQUIPO DE SERVICIOS.

ESTA QUERY FUE CONSTRUÍDA POR EL EQUIPO SIGSE COMO APOYO AL CLIENTE, 
PERO NO HA SIDO VALIDADA POR EL EQUIPO DE SERVICIOS DE SOFTEXPERT. 
SIGSE NO SE HACE RESPONSABLE DE LOS COMANDOS EJECUTADOS POR EL CLIENTE
SIN LA APROBACIÓN DE SOFTEXPERT.
**/ 
UPDATE PRTASK SET CDTASKTYPE = RESULTADO_SQL_2
WHERE CDBASETASK = RESULTADO_SQL_3