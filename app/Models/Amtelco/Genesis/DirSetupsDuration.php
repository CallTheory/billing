<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class DirSetupsDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The amount of time in minutes agents spent making changes to an IS Directory Subject that has a Client configured as the Billing Client.';
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
