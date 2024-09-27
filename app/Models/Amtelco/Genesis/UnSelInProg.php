<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class UnSelInProg extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Unselected in-progress time for calls in the InProgress state.';
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
