<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class DispDeleted extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of the number of dispatch jobs deleted by the IS system or agents.';
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
