<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Dispatches extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of dispatches. This does not include dispatch jobs that have been purged from the database.';
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
