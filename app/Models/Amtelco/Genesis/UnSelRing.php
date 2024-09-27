<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class UnSelRing extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Unselected ringing time for calls in the Ring state.';
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
