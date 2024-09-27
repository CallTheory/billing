<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class TapIn extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of incoming TAP messages. This count includes replies and unsolicited TAP messages.';
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
