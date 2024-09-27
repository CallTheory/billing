<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class FaxDelivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of messages delivered by the Fax Station.';
    }
    public function amtelcoSqlCommand(): string
    {
        return
            <<<TSQL
        select 'TODO';
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        return [];
    }
}
