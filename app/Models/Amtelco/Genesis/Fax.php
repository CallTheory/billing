<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Fax extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of fax messages.';
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
