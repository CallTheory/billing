<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SelOutboundQueue extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of Selected time an outbound call was in queue waiting for a dialout trunk.';
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
