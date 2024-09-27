<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SelSecDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of all Selected time for Secretarial calls.';
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
