<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Snpp extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Simple Network Paging Protocol (SNPP) messages.';
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
