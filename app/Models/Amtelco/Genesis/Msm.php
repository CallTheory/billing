<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Msm extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Amtelco Secure Messaging (MSM) messages.';
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
