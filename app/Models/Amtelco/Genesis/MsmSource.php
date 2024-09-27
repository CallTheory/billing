<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MsmSource extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of MergeComm jobs triggered by MSM.';
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
