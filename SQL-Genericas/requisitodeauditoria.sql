SELECT
/**
Creación:
2022-06-02. Andrés Del Río. Lista los requisitos asociados a las auditorías en el alcance de auditoría
Versión: 2.1.8.59

**/
        AUAUDIT.IDAUDIT,
        AUAUDIT.NMAUDIT,
        RQREQUIREMENT.IDREQUIREMENT,
        RQREQUIREMENT.NMREQUIREMENT
    FROM
        AUAUDIT                                                                                          
    INNER JOIN
        AUSCOPESTRUCT                                                                                                  
            ON (
                AUSCOPESTRUCT.CDSCOPEDEFINITION=AUAUDIT.CDSCOPEDEFINITION                                                                                                 
            )                                                                                          
    INNER JOIN
        AUSTRUCTASSOC                                                                                                  
            ON (
                AUSTRUCTASSOC.CDSTRUCT=AUSCOPESTRUCT.CDSTRUCT                                                                                                 
            )                                                                                         
    INNER JOIN
        RQREQUIREMENT                                                                                                 
            ON (
                RQREQUIREMENT.CDREQUIREMENT = AUSTRUCTASSOC.CDREQUIREMENT
                AND RQREQUIREMENT.CDREVISION =  AUSTRUCTASSOC.CDREQUIREMENTREVISION
            )                                                                                          
    WHERE
        AUSCOPESTRUCT.CDSTRUCT=AUSCOPESTRUCT.CDSTRUCTROOT