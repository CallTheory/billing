<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class EmailUrgent extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of e-mail messages flagged Urgent.';
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
