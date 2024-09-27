<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Hl7SourceDur extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The total duration of all MergeComm jobs triggered by HL7.';
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
