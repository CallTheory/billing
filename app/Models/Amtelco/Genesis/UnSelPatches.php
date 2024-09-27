<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class UnSelPatches extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of patches without an agent.';
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
