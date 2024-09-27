<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class OrbitDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of all calls that were put into orbit.';
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
