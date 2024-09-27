<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class AnnCalls extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of all Announcement calls.';
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
