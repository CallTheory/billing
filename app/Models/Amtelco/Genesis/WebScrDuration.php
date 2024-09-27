<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class WebScrDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'This field is not currently implemented.';
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
