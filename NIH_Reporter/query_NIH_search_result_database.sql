.mode csv
SELECT
    'Total records' AS label,
    count(*) AS count
FROM awards;
SELECT
    'Inner ear' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
)
GROUP BY fiscal_year;

SELECT
    'Auditory' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '% utricl%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%vestibular labyrinth%'
    AND abstract_text NOT LIKE '%vestibular epitheli%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%cupula%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
)
GROUP BY fiscal_year;

SELECT
    'Vestibular' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%inner hair cell%'
    AND abstract_text NOT LIKE '%outer hair cell%'
    AND abstract_text NOT LIKE '%auditory hair cell%'
    AND abstract_text NOT LIKE '%organ of corti%'
    AND abstract_text NOT LIKE '%basilar papilla%'
    AND abstract_text NOT LIKE '%stria vascular%'
    AND abstract_text NOT LIKE '%basilar membrane%'
    AND abstract_text NOT LIKE '%reissner%'
    AND abstract_text NOT LIKE '%spiral gangli%'
    AND abstract_text NOT LIKE '%auditory nerv%'
)
GROUP BY fiscal_year;

SELECT
    'Not either auditory or vestibular' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%vestibular epitheli%'
    AND abstract_text NOT LIKE '%vestibular labyrinth%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '%cupula%'
    AND abstract_text NOT LIKE '% utric%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%inner hair cell%'
    AND abstract_text NOT LIKE '%outer hair cell%'
    AND abstract_text NOT LIKE '%auditory hair cell%'
    AND abstract_text NOT LIKE '%basilar papilla%'
    AND abstract_text NOT LIKE '%stria vascular%'
    AND abstract_text NOT LIKE '%basilar membrane%'
    AND abstract_text NOT LIKE '%reissner%'
    AND abstract_text NOT LIKE '%spiral gangli%'
    AND abstract_text NOT LIKE '%auditory nerv%'
    AND abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%organ of corti%'
)
GROUP BY fiscal_year;

SELECT
    'Sum of total amounts by year for all inner ear grants' AS label,
    fiscal_year,
    sum(award_amount) AS award_sum
FROM awards
WHERE
    (
        abstract_text LIKE '%cochlea%'
        OR abstract_text LIKE '%inner hair cell%'
        OR abstract_text LIKE '%outer hair cell%'
        OR abstract_text LIKE '%auditory hair cell%'
        OR abstract_text LIKE '%basilar papilla%'
        OR abstract_text LIKE '%stria vascular%'
        OR abstract_text LIKE '%reissner%'
        OR abstract_text LIKE '%spiral gangli%'
        OR abstract_text LIKE '%auditory nerv%'
        OR abstract_text LIKE '%vestibular labyrinth%'
        OR abstract_text LIKE '%vestibular gangli%'
        OR abstract_text LIKE '%vestibular nerv%'
        OR abstract_text LIKE '%semicircular %'
        OR abstract_text LIKE '%vestibular macula%'
        OR abstract_text LIKE '%otolith%'
        OR abstract_text LIKE '%otoconi%'
        OR abstract_text LIKE '%crista ampullaris%'
        OR abstract_text LIKE '%cupula%'
        OR abstract_text LIKE '% utric%'
        OR abstract_text LIKE '%saccul%'
        OR abstract_text LIKE '%organ of corti%'
    )
    AND (
        abstract_text NOT LIKE '%prostatic%'
        AND abstract_text NOT LIKE '%laryngeal%'
    )
GROUP BY fiscal_year;

SELECT
    'Total award amounts by year for only grants with auditory terms' AS label,
    fiscal_year,
    sum(award_amount) AS award_sum
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '% utricl%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%vestibular labyrinth%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '%cupula%'
)
GROUP BY fiscal_year;

SELECT
    'Sum of total award amounts by year for only grants with vestibular terms' AS label,
    fiscal_year,
    sum(award_amount) AS award_sum
FROM awards
WHERE (
    abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%outer hair cell%'
    AND abstract_text NOT LIKE '%auditory hair cell%'
    AND abstract_text NOT LIKE '%organ of corti%'
    AND abstract_text NOT LIKE '%basilar papilla%'
    AND abstract_text NOT LIKE '%stria vascular%'
    AND abstract_text NOT LIKE '%basilar membrane%'
    AND abstract_text NOT LIKE '%reissner%'
    AND abstract_text NOT LIKE '%spiral gangli%'
    AND abstract_text NOT LIKE '%auditory nerv%'
)
GROUP BY fiscal_year;

SELECT
    'Sum of total award amounts by year for grants with neither auditory nor vestibular' AS label,
    fiscal_year,
    sum(award_amount) AS award_sum
FROM awards
WHERE (
    abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%cupula%'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%vestibular epitheli%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '% utric%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%outer hair cell%'
    AND abstract_text NOT LIKE '%auditory hair cell%'
    AND abstract_text NOT LIKE '%basilar papilla%'
    AND abstract_text NOT LIKE '%stria vascular%'
    AND abstract_text NOT LIKE '%basilar membrane%'
    AND abstract_text NOT LIKE '%reissner%'
    AND abstract_text NOT LIKE '%spiral gangli%'
    AND abstract_text NOT LIKE '%auditory nerv%'
    AND abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%organ of corti%'
)
GROUP BY fiscal_year;

SELECT
    'Total inner ear K awards' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
)
AND activity_code IN (
    'K00', 'K01', 'K08', 'K12',
    'K14', 'K18', 'K18', 'K21', 'K22', 'K23', 'K24',
    'K25', 'K26', 'K30', 'K38', 'K43', 'K76', 'K99',
    'KD1', 'KL1', 'KL2', 'KM1'
)
GROUP BY fiscal_year;

SELECT
    'Total auditory K awards' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '% utricl%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%vestibular labyrinth%'
    AND abstract_text NOT LIKE '%vestibular epitheli%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%cupula%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
)
AND activity_code IN (
    'K00', 'K01', 'K08', 'K12',
    'K14', 'K18', 'K18', 'K21', 'K22',
    'K23', 'K24', 'K25', 'K26', 'K30',
    'K38', 'K43', 'K76', 'K99', 'KD1',
    'KL1', 'KL2', 'KM1'
)
GROUP BY fiscal_year;

SELECT
    'Total vestibular K awards' AS label,
    fiscal_year,
    coalesce(count(*), 0) AS count
FROM awards
WHERE
    (
        abstract_text LIKE '%vestibular labyrinth%'
        OR abstract_text LIKE '%semicircular %'
        OR abstract_text LIKE '%vestibular macula%'
        OR abstract_text LIKE '%vestibular epitheli%'
        OR abstract_text LIKE '%vestibular gangli%'
        OR abstract_text LIKE '%vestibular nerv%'
        OR abstract_text LIKE '%otolith%'
        OR abstract_text LIKE '%otoconi%'
        OR abstract_text LIKE '%crista ampullaris%'
        OR abstract_text LIKE '%cupula%'
        OR abstract_text LIKE '% utric%'
        OR abstract_text LIKE '%saccul%'
    )
    AND (
        abstract_text NOT LIKE '%prostatic%'
        AND abstract_text NOT LIKE '%laryngeal%'
        AND abstract_text NOT LIKE '%cochlea%'
        AND abstract_text NOT LIKE '%inner hair cell%'
        AND abstract_text NOT LIKE '%outer hair cell%'
        AND abstract_text NOT LIKE '%auditory hair cell%'
        AND abstract_text NOT LIKE '%organ of corti%'
        AND abstract_text NOT LIKE '%basilar papilla%'
        AND abstract_text NOT LIKE '%stria vascular%'
        AND abstract_text NOT LIKE '%basilar membrane%'
        AND abstract_text NOT LIKE '%reissner%'
        AND abstract_text NOT LIKE '%spiral gangli%'
        AND abstract_text NOT LIKE '%auditory nerv%'
    )
    AND activity_code IN (
        'K00', 'K01', 'K08', 'K12',
        'K14', 'K18', 'K18', 'K21', 'K22', 'K23', 'K24',
        'K25', 'K26', 'K30', 'K38', 'K43', 'K76', 'K99',
        'KD1', 'KL1', 'KL2', 'KM1'
    )
GROUP BY fiscal_year;

SELECT
    'Total inner ear F awards' AS label,
    fiscal_year,
    coalesce(count(*), 0) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
)
AND activity_code IN (
    'F30', 'F31', 'F32', 'F33', 'F37',
    'F38', 'F99', 'FI2', 'FM1'
)
GROUP BY fiscal_year;

SELECT
    'Total auditory F awards' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '% utricl%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%vestibular labyrinth%'
    AND abstract_text NOT LIKE '%vestibular epitheli%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%cupula%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
)
AND activity_code IN (
    'F30', 'F31', 'F32', 'F33',
    'F37', 'F38', 'F99', 'FI2', 'FM1'
)
GROUP BY fiscal_year;

SELECT
    'Total vestibular F awards' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%inner hair cell%'
    AND abstract_text NOT LIKE '%outer hair cell%'
    AND abstract_text NOT LIKE '%auditory hair cell%'
    AND abstract_text NOT LIKE '%organ of corti%'
    AND abstract_text NOT LIKE '%basilar papilla%'
    AND abstract_text NOT LIKE '%stria vascular%'
    AND abstract_text NOT LIKE '%basilar membrane%'
    AND abstract_text NOT LIKE '%reissner%'
    AND abstract_text NOT LIKE '%spiral gangli%'
    AND abstract_text NOT LIKE '%auditory nerv%'
)
AND activity_code IN (
    'F30', 'F31', 'F32', 'F33',
    'F37', 'F38', 'F99', 'FI2', 'FM1'
)
GROUP BY fiscal_year;

SELECT
    'Total inner ear T awards' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
)
AND activity_code IN (
    'T01', 'T02', 'T09', 'T14', 'T15',
    'T32', 'T34', 'T35', 'T37', 'T42',
    'T90', 'TL1', 'TL4', 'TU2'
)
GROUP BY fiscal_year;

SELECT
    'Total auditory T awards' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '% utricl%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%vestibular labyrinth%'
    AND abstract_text NOT LIKE '%vestibular epitheli%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%cupula%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
)
AND activity_code IN (
    'T01', 'T02', 'T09', 'T14',
    'T15', 'T32', 'T34', 'T35', 'T37',
    'T42', 'T90', 'TL1', 'TL4', 'TU2'
)
GROUP BY fiscal_year;

SELECT
    'Total vestibular F awards' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%inner hair cell%'
    AND abstract_text NOT LIKE '%outer hair cell%'
    AND abstract_text NOT LIKE '%auditory hair cell%'
    AND abstract_text NOT LIKE '%organ of corti%'
    AND abstract_text NOT LIKE '%basilar papilla%'
    AND abstract_text NOT LIKE '%stria vascular%'
    AND abstract_text NOT LIKE '%basilar membrane%'
    AND abstract_text NOT LIKE '%reissner%'
    AND abstract_text NOT LIKE '%spiral gangli%'
    AND abstract_text NOT LIKE '%auditory nerv%'
)
AND activity_code IN (
    'T01', 'T02', 'T09', 'T14',
    'T15', 'T32', 'T34', 'T35', 'T37', 'T42', 'T90',
    'TL1', 'TL4', 'TU2'
)
GROUP BY fiscal_year;

SELECT
    'Sum of total training grant award (F,K, T) amounts by year for grants only containing auditory terms' AS label,
    fiscal_year,
    count(*) AS count
FROM awards
WHERE (
    abstract_text LIKE '%cochlea%'
    OR abstract_text LIKE '%inner hair cell%'
    OR abstract_text LIKE '%outer hair cell%'
    OR abstract_text LIKE '%auditory hair cell%'
    OR abstract_text LIKE '%basilar papilla%'
    OR abstract_text LIKE '%stria vascular%'
    OR abstract_text LIKE '%reissner%'
    OR abstract_text LIKE '%spiral gangli%'
    OR abstract_text LIKE '%auditory nerv%'
    OR abstract_text LIKE '%organ of corti%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '% utricl%'
    AND abstract_text NOT LIKE '%saccul%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%vestibular labyrinth%'
    AND abstract_text NOT LIKE '%vestibular gangli%'
    AND abstract_text NOT LIKE '%vestibular nerv%'
    AND abstract_text NOT LIKE '%semicircular %'
    AND abstract_text NOT LIKE '%vestibular macula%'
    AND abstract_text NOT LIKE '%otolith%'
    AND abstract_text NOT LIKE '%otoconi%'
    AND abstract_text NOT LIKE '%crista ampullaris%'
    AND abstract_text NOT LIKE '%cupula%'
)
AND activity_code IN (
    'K00', 'K01', 'K08', 'K12',
    'K14', 'K18', 'K18', 'K21', 'K22', 'K23', 'K24',
    'K25', 'K26', 'K30', 'K38', 'K43', 'K76', 'K99',
    'KD1', 'KL1', 'KL2', 'KM1', 'F30', 'F31', 'F32',
    'F33', 'F37', 'F38', 'F99', 'FI2', 'FM1', 'T02',
    'T09', 'T14', 'T15', 'T32', 'T34', 'T35', 'T37',
    'T42', 'T90', 'TL1', 'TL4', 'TU2'
)
GROUP BY fiscal_year;

SELECT
    'Sum of total training grant award (F, K, T) amounts by year for grants only containing vestibular terms' AS label,
    fiscal_year,
    sum(award_amount) AS award_sum
FROM awards
WHERE (
    abstract_text LIKE '%vestibular labyrinth%'
    OR abstract_text LIKE '%semicircular %'
    OR abstract_text LIKE '%vestibular macula%'
    OR abstract_text LIKE '%vestibular epitheli%'
    OR abstract_text LIKE '%vestibular gangli%'
    OR abstract_text LIKE '%vestibular nerv%'
    OR abstract_text LIKE '%otolith%'
    OR abstract_text LIKE '%otoconi%'
    OR abstract_text LIKE '%crista ampullaris%'
    OR abstract_text LIKE '%cupula%'
    OR abstract_text LIKE '% utric%'
    OR abstract_text LIKE '%saccul%'
)
AND (
    abstract_text NOT LIKE '%prostatic%'
    AND abstract_text NOT LIKE '%laryngeal%'
    AND abstract_text NOT LIKE '%cochlea%'
    AND abstract_text NOT LIKE '%inner hair cell%'
    AND abstract_text NOT LIKE '%outer hair cell%'
    AND abstract_text NOT LIKE '%auditory hair cell%'
    AND abstract_text NOT LIKE '%organ of corti%'
    AND abstract_text NOT LIKE '%basilar papilla%'
    AND abstract_text NOT LIKE '%stria vascular%'
    AND abstract_text NOT LIKE '%basilar membrane%'
    AND abstract_text NOT LIKE '%reissner%'
    AND abstract_text NOT LIKE '%spiral gangli%'
    AND abstract_text NOT LIKE '%auditory nerv%'
)
AND activity_code IN (
    'K00', 'K01', 'K08', 'K12',
    'K14', 'K18', 'K18', 'K21', 'K22', 'K23', 'K24',
    'K25', 'K26', 'K30', 'K38', 'K43', 'K76', 'K99',
    'KD1', 'KL1', 'KL2', 'KM1', 'F30', 'F31', 'F32',
    'F33', 'F37', 'F38', 'F99', 'FI2', 'FM1', 'T02',
    'T09', 'T14', 'T15', 'T32', 'T34', 'T35', 'T37',
    'T42', 'T90', 'TL1', 'TL4', 'TU2'
)
GROUP BY fiscal_year;
