<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class RaulandBorgSourceDur extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The total duration of all MergeComm jobs triggered by Rauland Responder.';
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
