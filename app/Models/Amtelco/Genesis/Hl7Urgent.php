<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Hl7Urgent extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of HL7 Service messages flagged Urgent.';
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
