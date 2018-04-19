/* Function to parse a varchar timestamp value into the total number of seconds */
@delimiter %%%;
CREATE
FUNCTION "datalayer".timeToSec (tstamp VARCHAR(20))
    RETURN INTEGER AS
    BEGIN
        RETURN (CAST(extract(hour FROM to_timestamp(tstamp,'HH24:MI:SS')) AS INT) * 3600) +
            (CAST (extract(minute FROM to_timestamp(tstamp,'HH24:MI:SS')) AS INT) * 60)
            + (CAST (extract(second FROM to_timestamp(tstamp,'HH24:MI:SS')) AS INT));
    END;
    %%%
@delimiter ;
%%%

/* Example Usage */
/* select timeToSec('00:56:41') from dual; */

/* Drop function once complete */
/* DROP FUNCTION "datalayer"."timeToSec"(tstamp VARCHAR) */
