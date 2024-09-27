<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MsgDlvrd extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of messages delivered.';
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
