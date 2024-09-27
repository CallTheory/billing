<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Hl7Delivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of messages delivered by the HL7 Service.';
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
