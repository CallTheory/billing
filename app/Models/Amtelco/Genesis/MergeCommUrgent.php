<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MergeCommUrgent extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of MergeComm messages flagged Urgent.';
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
