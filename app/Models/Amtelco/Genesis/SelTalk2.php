<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SelTalk2 extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Selected talk time for calls in the Talk2 state, the second leg of a conference call.';
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
