<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MsgTaken extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of messages taken. This does not include messages that have been purged from the database.';
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
