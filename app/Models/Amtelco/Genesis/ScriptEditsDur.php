<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class ScriptEditsDur extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The duration of time users spent in the Easy Script Editor before saving script changes.';
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
