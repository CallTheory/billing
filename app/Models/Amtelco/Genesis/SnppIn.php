<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SnppIn extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of incoming SNPP messages. This count includes replies and unsolicited SNPP messages.';
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
