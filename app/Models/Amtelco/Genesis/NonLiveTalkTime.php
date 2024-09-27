<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class NonLiveTalkTime extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of Talk time for all calls not categorized as Secretarial or Check-in.';
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
