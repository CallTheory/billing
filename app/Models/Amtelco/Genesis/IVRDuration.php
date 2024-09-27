<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class IVRDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of all IVR calls.';
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
