<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class CngClientDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of all Change Client calls.';
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
