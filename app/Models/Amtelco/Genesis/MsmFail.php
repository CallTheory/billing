<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MsmFail extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of MSM messages that generated an error message.';
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
