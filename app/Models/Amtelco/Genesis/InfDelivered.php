<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class InfDelivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of messages delivered by the Infinity Bridge.';
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
