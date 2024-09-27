<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SmtpDelivered extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of messages delivered by the internal SMTP server, usually for MergeComm.';
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
