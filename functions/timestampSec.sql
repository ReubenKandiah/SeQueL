@delimiter %%%;
CREATE
FUNCTION "datalayer".timestampSec (logdate DATE, logtime VARCHAR)
    RETURN INTEGER AS
    BEGIN
        RETURN 
        (CAST (logdate::DATE - to_date ('1900-01-01', 'yyyy-mm-dd' )
                            AS INT) * 86400) + (extract (hour FROM to_timestamp (logtime,
                            'HH24:MI:SS')) * 3600 ) + (extract (minute FROM to_timestamp (logtime
                            , 'HH24:MI:SS')) * 60) + (extract(seconds FROM to_timestamp (logtime,
                            'HH24:MI:SS' ) ) );
    END;
    %%%
@delimiter ;
%%%
