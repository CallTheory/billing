<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class ScriptEditsDur extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of time users spent in the Easy Script Editor before saving script changes.';
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
        if(!isset($this->maintenanceID)){
            throw new Exception('Maintenance ID is required');
        }

        return [
            [
                $this->maintenanceID, SQLSRV_PARAM_IN, SQLSRV_PHPTYPE_INT, SQLSRV_SQLTYPE_BIGINT
            ]
        ];
    }
}
