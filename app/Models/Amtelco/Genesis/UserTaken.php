<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class UserTaken extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of messages taken by IS Agents';
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
