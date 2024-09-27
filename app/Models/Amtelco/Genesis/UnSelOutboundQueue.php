<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class UnSelOutboundQueue extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of Unselected time an outbound call was in queue waiting for a dialout trunk.';
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
