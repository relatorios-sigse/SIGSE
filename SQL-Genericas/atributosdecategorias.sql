SELECT
/**
Creación:
2022-06-06. Andrés Del Río. Permite listar las categorías asociados a un atributo específico.
Si se quita el filtro (todo lo que hay a partir del WHERE), listará todos los pares categoría-atributo
relacionados.


**/
        C.IDCATEGORY,
        C.NMCATEGORY,
        AC.FGREQUIRED,
		AC.NRORDER,
		AC.FGREADONLY,
		A.NMATTRIBUTE,
		A.NMLABEL
    FROM
        DCCATDOCATTRIB AC 
    JOIN
        DCCATEGORY C 
            ON C.CDCATEGORY = AC.CDCATEGORY 
    JOIN
        ADATTRIBUTE A 
            ON A.CDATTRIBUTE = AC.CDATTRIBUTE 
    WHERE
        A.NMATTRIBUTE = 'SD7-BOLETIN'