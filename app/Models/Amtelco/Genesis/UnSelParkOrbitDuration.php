<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class UnSelParkOrbitDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Unselected time for calls that went to Park Line Pickup.';
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
