<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class FaxIn extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of incoming fax messages. This count includes replies and unsolicited fax messages.';
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
