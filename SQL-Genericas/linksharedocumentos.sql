SELECT
/**
Creación:
2022-07-14. Andrés Del Río. Permite saber si se ha generado un enlace de compartimento de documento (LINKSHARE),
sea dicho enlace público (sin login) o privado (con login).

**/
        dr.iddocument,
        li.fgpublic,
        CASE 
            when li.fgpublic is null 
            or li.fgpublic = 2 then 'privado' 
            else 'público' 
        END tipo_link,
        li.nmlinkkey 
    FROM
        dcdocrevision dr 
    LEFT JOIN
        dclinkshare dl 
            ON dl.cddocument = dr.cddocument 
    LEFT JOIN
        gnlinkshare li 
            ON li.cdlink = dl.cdlink 
    WHERE
        dr.fgcurrent = 1 