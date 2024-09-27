<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SmtpUrgDelivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of urgent messages delivered by the internal SMTP Server, usually for MergeComm.';
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
