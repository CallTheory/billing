<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SecTalkTime extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of Talk time for all Secretarial calls.';
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
