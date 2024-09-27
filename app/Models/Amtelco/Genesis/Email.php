<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Email extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of e-mail messages.';
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
