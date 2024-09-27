<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class OtherSource extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of MergeComm jobs triggered by a source not listed in the following fields of the report.';
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
