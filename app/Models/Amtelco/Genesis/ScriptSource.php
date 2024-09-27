<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class ScriptSource extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of MergeComm jobs triggered by a script.';
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
