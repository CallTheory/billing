<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class DispDeleted extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of the number of dispatch jobs deleted by the IS system or agents.';
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
            and statDispatchDeleted.Reason = 2;
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        return [];
    }
}
