<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class ScriptEdits extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of the number of times script changes were saved.';
    }
    public function amtelcoSqlCommand(): string
    {
        return
        <<<TSQL
            select
                cltClients.cltID,
                cltClients.ClientNumber,
                cltClients.BillingCode,
                cltClients.ClientName,
                statClientMaintenance.ID as MaintenanceID,
                statClientMaintenance.agtID,
                statClientMaintenance.stnID,
                statClientMaintenance.stnType,
                statClientMaintenance.Stamp,
                statClientMaintenance.Duration,
                statClientMaintenance.[Type],
                 statClientMaintenance.Saved
            from statClientMaintenance
            left join cltClients on cltClients.cltID = statClientMaintenance.cltID
            where statClientMaintenance.ID = ?
            and statClientMaintenance.[Type] = 1;
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        return [];
    }
}
