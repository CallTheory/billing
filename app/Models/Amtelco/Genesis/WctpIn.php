<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class WctpIn extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of incoming WCTP messages. This count includes replies and unsolicited WCTP messages.';
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
