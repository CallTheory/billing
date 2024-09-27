<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MergeCommUrgDelivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of urgent messages delivered by MergeComm.';
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
