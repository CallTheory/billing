<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Wctp extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Wireless Communications Transfer Protocol (WCTP) messages.';
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
