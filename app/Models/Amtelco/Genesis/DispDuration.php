<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class DispDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of dispatches. This is calculated as the difference between the date and time the dispatch job was created and the date and time that the dispatch job was deleted. Dispatch jobs that were not deleted are not included in this calculation.';
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
