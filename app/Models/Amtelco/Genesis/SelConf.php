<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SelConf extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Selected conference time for calls in the Conference state. The Conference state is when the call is connected to leg1, leg2 and an agent.';
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
