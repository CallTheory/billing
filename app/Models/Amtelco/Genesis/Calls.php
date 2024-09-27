<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Calls extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The total calls of all Call Types.';
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
