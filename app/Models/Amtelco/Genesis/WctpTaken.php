<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class WctpTaken extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of messages taken by the WCTP component of the IS Service.';
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
