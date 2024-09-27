<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class FaxUrgent extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of fax messages flagged Urgent.';
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
