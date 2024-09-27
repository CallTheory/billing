<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class AutoUrgDelivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'This field is not currently implemented.';
    }
    public function amtelcoSqlCommand(): string
    {
        return
        <<<TSQL
        select 0;
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        return [];
    }
}
