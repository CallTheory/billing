<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Dispatches extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of dispatches. This does not include dispatch jobs that have been purged from the database.';
    }
    public function amtelcoSqlCommand(): string
    {
        return
        <<<TSQL
            SELECT
                statDispatchAdded.dispID as [DispatchID],
                statDispatchAdded.[Timestamp],
                statDispatchAdded.JobName,
                statDispatchAdded.msgID,
                statDispatchAdded.cltID,
                statDispatchAdded.agtID,
                statDispatchAdded.Groups,
                statDispatchAdded.TimezoneOffset
            FROM statDispatchAdded
            where statDispatchAdded.dispID = ?;
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        if(!isset($this->dispatchID)){
            throw new Exception('Dispatch ID is required');
        }

        return [
            [
                $this->dispatchID, SQLSRV_PARAM_IN, SQLSRV_PHPTYPE_INT, SQLSRV_SQLTYPE_BIGINT
            ]
        ];
    }
}
