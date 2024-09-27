<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class DirSetups extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of times agents saved changes to an IS Directory Subject that has a Client configured as the Billing Client.';
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
