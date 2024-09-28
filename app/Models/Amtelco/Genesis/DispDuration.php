<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class DispDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of dispatches. This is calculated as the difference between the date and time the dispatch job was created and the date and time that the dispatch job was deleted. Dispatch jobs that were not deleted are not included in this calculation.';
    }
    public function amtelcoSqlCommand(): string
    {
        return
        <<<TSQL
            SELECT
                statDispatchAdded.dispID as [DispatchID],
                statDispatchAdded.JobName,
                cltClients.cltID,
                cltClients.ClientNumber,
                cltClients.BillingCode,
                cltClients.ClientName,
                statDispatchAdded.[Timestamp] as DispatchStarted,
                statDispatchDeleted.[Timestamp] as [DispatchEnded],
                CAST(DATEDIFF(SS, statDispatchAdded.Timestamp , statDispatchDeleted.Timestamp) AS decimal(18,0)) AS Duration,
                statDispatchAdded.TimezoneOffset,
                statDispatchAdded.msgID,
                statDispatchAdded.cltID,
                statDispatchAdded.agtID as DispatchStartAgtID,
                statDispatchDeleted.agtID as DispatchEndAgtID,
                statDispatchAdded.Groups
            from statDispatchDeleted
                JOIN statDispatchAdded  ON statDispatchAdded.dispID = statDispatchDeleted.dispID
                left join cltClients on statDispatchAdded.cltid = cltClients.cltId
            where statDispatchAdded.dispID = ?
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        return [];
    }
}
