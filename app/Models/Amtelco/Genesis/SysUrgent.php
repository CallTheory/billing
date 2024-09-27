<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SysUrgent extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of system messages flagged Urgent.';
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
