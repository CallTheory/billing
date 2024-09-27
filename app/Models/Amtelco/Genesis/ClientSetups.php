<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class ClientSetups extends GenesisStat
{

    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of the number of times Client Setup changes were saved.';
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
