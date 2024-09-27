<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class AbandonedCalls extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of calls that were abandoned. Abandons are calls that ended with the caller hanging up without the call being answered by an agent.';
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
