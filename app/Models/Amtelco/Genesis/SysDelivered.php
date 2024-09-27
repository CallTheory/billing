<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SysDelivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of messages delivered by the IS system.';
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
