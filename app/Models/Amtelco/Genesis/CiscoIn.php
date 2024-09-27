<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class CiscoIn extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of incoming Cisco IP Phone messages. This count includes replies and unsolicited Cisco messages.';
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
