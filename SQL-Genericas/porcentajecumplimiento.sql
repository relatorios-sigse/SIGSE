SELECT
/**
Creación:
2022-06-02. Andrés Del Río. Calcula la proporción de requisitos cuyo nivel de conformidad
fue "CUMPLE", para una auditoría determinada.
Versión: 2.1.8.59

**/
        ROUND(100.0 * TMP.TOTAL_PARTITION / TMP.TOTAL,
        2 ) PORC_CUMPLE,
        TMP.* 
    FROM
        (SELECT
            DISTINCT    AUAUDIT.IDAUDIT,
            AUAUDIT.NMAUDIT,
            AUCONFORMITYLEVEL.IDCONFORMITYLEVEL,
            COUNT(AUCONFORMITYLEVEL.IDCONFORMITYLEVEL) OVER(                   
        ORDER BY
            AUCONFORMITYLEVEL.IDCONFORMITYLEVEL) TOTAL_PARTITION,
            COUNT(AUCONFORMITYLEVEL.IDCONFORMITYLEVEL) OVER()  TOTAL            
        FROM
            AUAUDIT             
        JOIN
            AUSCOPESTRUCT                  
                ON AUSCOPESTRUCT.CDSCOPEDEFINITION=AUAUDIT.CDSCOPEDEFINITION                                                                                
        JOIN
            AUCONFORMITYLEVEL                                                                                                                     
                ON (
                    AUSCOPESTRUCT.CDAUDITEVALCRIT=AUCONFORMITYLEVEL.CDAUDITEVALCRIT                                                                                                                                     
                    AND AUSCOPESTRUCT.CDAUDITEVALCRITREV=AUCONFORMITYLEVEL.CDAUDITEVALCRITREV                                                                                                                                     
                    AND AUSCOPESTRUCT.CDCONFORMITYLEVEL=AUCONFORMITYLEVEL.CDCONFORMITYLEVEL                                                                                                                    
                )                                                                                  
        WHERE
            AUAUDIT.IDAUDIT = 'AI-FW -LVE-2022-01' )  TMP    
    WHERE
        TMP.IDCONFORMITYLEVEL = 'CUMPLE'