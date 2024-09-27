<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class AnsweredCalls extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of calls that were answered.';
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
