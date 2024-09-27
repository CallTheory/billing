<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class Sms extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Short Message Service (SMS) text messages.';
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
