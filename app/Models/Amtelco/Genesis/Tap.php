<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Tap extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Telocator Alphanumeric Protocol (TAP) paging messages.';
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
