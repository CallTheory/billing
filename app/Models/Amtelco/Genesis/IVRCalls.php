<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class IVRCalls extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of all Interactive Voice Response (IVR) calls.';
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
