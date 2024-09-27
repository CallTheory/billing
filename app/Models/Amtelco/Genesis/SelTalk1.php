<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SelTalk1 extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Selected talk time for calls in the Talk1 state, the first leg of a conference call.';
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
