<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Cisco extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Cisco IP Phone messages.';
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
