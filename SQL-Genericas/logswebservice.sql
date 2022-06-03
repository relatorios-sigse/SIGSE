SELECT
/**
Creación:
2022-06-03. Andrés Del Río. Permite consultar mensajes de error producidos por la falla de ejecución
de fuentes de datos (webservice)

**/
        TXENDPOINT,
        IDDATASOURCE,
        NMDATASOURCE,
        NMMETHOD,
        TXERRORMSG 
    FROM
        SEWSLOG 
    WHERE
        IDDATASOURCE = 'WSWORKFLOW' 
        AND NMMETHOD = 'newAssocWorkflow'