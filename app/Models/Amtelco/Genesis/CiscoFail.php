<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class CiscoFail extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Cisco IP Phone messages that generated an error message.';
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
