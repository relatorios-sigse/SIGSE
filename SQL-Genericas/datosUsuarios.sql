SELECT
/**
Creación:
2022-07-04. Andrés Del Río. Permite extraer datos de los usuarios activos, especificamente: matrícula, login, nombre, email, 
función y área estándar asociados. Si es necesario filtrar la información de un solo usuario, agregar al final AND U.IDUSER = :campoMatrículaEnForm
La aplicación le pedirá seleccionar el campo del formulario que tiene ese dato del usuario.

**/
        U.IDUSER,
        U.IDLOGIN,
        U.NMUSER,
        U.DSUSEREMAIL,
        P.IDPOSITION,
        P.NMPOSITION,
        D.IDDEPARTMENT,
        D.NMDEPARTMENT 
    FROM
        ADUSERDEPTPOS UDP  
    JOIN
        ADUSER U 
            ON U.CDUSER = UDP.CDUSER 
    JOIN
        ADPOSITION P 
            ON P.CDPOSITION = UDP.CDPOSITION 
    JOIN
        ADDEPARTMENT D 
            ON D.CDDEPARTMENT = UDP.CDDEPARTMENT 
    WHERE
        U.FGUSERENABLED = 1 
        AND UDP.FGDEFAULTDEPTPOS = 1